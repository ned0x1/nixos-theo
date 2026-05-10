#!/usr/bin/env python3

import gi
gi.require_version("Playerctl", "2.0")

from gi.repository import Playerctl, GLib
from gi.repository.Playerctl import Player
import argparse
import logging
import sys
import signal
import json
import os
from typing import List

logger = logging.getLogger(__name__)


def signal_handler(sig, frame):
    logger.info("Received signal to stop, exiting")
    sys.stdout.write("\n")
    sys.stdout.flush()
    sys.exit(0)


class PlayerManager:
    def __init__(self, selected_player=None, excluded_player=None):
        self.manager = Playerctl.PlayerManager()
        self.loop = GLib.MainLoop()

        self.manager.connect("name-appeared", self.on_player_appeared)
        self.manager.connect("player-vanished", self.on_player_vanished)

        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
        signal.signal(signal.SIGPIPE, signal.SIG_DFL)

        self.selected_player = selected_player
        self.excluded_player = (
            [p.strip() for p in excluded_player.split(",")]
            if excluded_player else []
        )

        self.init_players()

    def init_players(self):
        for player in self.manager.props.player_names:
            if player.name in self.excluded_player:
                continue
            if self.selected_player and self.selected_player != player.name:
                continue
            self.init_player(player)

    def run(self):
        self.loop.run()

    def init_player(self, player):
        logger.info(f"Init player: {player.name}")

        player = Playerctl.Player.new_from_name(player)
        player.connect("playback-status", self.on_playback_status_changed)
        player.connect("metadata", self.on_metadata_changed)

        self.manager.manage_player(player)
        self.on_metadata_changed(player, player.props.metadata)

    def get_players(self) -> List[Player]:
        return self.manager.props.players

    def write_output(self, text, player):
        output = {
            "text": text,
            "class": "custom-" + player.props.player_name,
            "alt": player.props.player_name
        }

        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    def clear_output(self):
        sys.stdout.write("\n")
        sys.stdout.flush()

    def get_first_playing_player(self):
        players = self.get_players()

        if not players:
            return None

        for player in reversed(players):
            if player.props.status == "Playing":
                return player

        return players[0]

    def show_most_important_player(self):
        player = self.get_first_playing_player()
        if player:
            self.on_metadata_changed(player, player.props.metadata)
        else:
            self.clear_output()

    def on_playback_status_changed(self, player, status):
        self.on_metadata_changed(player, player.props.metadata)

    def on_metadata_changed(self, player, metadata):
        player_name = player.props.player_name
        artist = player.get_artist()
        title = player.get_title()

        if title:
            title = title.replace("&", "&amp;")

        track_info = ""

        if player_name == "spotify" and "mpris:trackid" in metadata:
            if ":ad:" in metadata["mpris:trackid"]:
                track_info = "Advertisement"
        elif artist and title:
            track_info = f"{artist} - {title}"
        else:
            track_info = title or ""

        if track_info:
            if player_name == "spotify":
                track_info += " "
            elif "chromium" in player_name:
                track_info += " "

            if player.props.status == "Playing":
                track_info = " " + track_info
            elif player.props.status == "Paused":
                track_info = " " + track_info

        if player.props.status == "Stopped":
            track_info = ""

        current = self.get_first_playing_player()

        if not current or current.props.player_name == player.props.player_name:
            self.write_output(track_info, player)

    def on_player_appeared(self, _, player):
        if player.name in self.excluded_player:
            return

        if not self.selected_player or player.name == self.selected_player:
            self.init_player(player)

    def on_player_vanished(self, _, player):
        self.show_most_important_player()


def parse_arguments():
    parser = argparse.ArgumentParser()

    parser.add_argument("-v", "--verbose", action="count", default=0)
    parser.add_argument(
        "-x",
        "--exclude",
        help="Comma-separated list of excluded players"
    )
    parser.add_argument("--player")
    parser.add_argument("--enable-logging", action="store_true")

    return parser.parse_args()


def main():
    args = parse_arguments()

    if args.enable_logging:
        logfile = os.path.join(
            os.path.dirname(os.path.realpath(__file__)),
            "media-player.log"
        )
        logging.basicConfig(
            filename=logfile,
            level=logging.DEBUG,
            format="%(asctime)s %(levelname)s:%(message)s"
        )

    logger.setLevel(max((3 - args.verbose) * 10, 0))

    player = PlayerManager(args.player, args.exclude)
    player.run()


if __name__ == "__main__":
    main()