{ config, pkgs, ... }:
let
  # Lookup table pour convertir caractères hex en valeurs
  hexCharValue = {
    "0" = 0; "1" = 1; "2" = 2; "3" = 3; "4" = 4; "5" = 5; "6" = 6; "7" = 7;
    "8" = 8; "9" = 9; "a" = 10; "b" = 11; "c" = 12; "d" = 13; "e" = 14; "f" = 15;
    "A" = 10; "B" = 11; "C" = 12; "D" = 13; "E" = 14; "F" = 15;
  };

  # Fonction pour convertir hex color en rgba
  hexToRgba = hex: alpha:
    let
      r = (hexCharValue."${builtins.substring 0 1 hex}" or 0) * 16 + (hexCharValue."${builtins.substring 1 1 hex}" or 0);
      g = (hexCharValue."${builtins.substring 2 1 hex}" or 0) * 16 + (hexCharValue."${builtins.substring 3 1 hex}" or 0);
      b = (hexCharValue."${builtins.substring 4 1 hex}" or 0) * 16 + (hexCharValue."${builtins.substring 5 1 hex}" or 0);
    in
    "rgba(${toString r}, ${toString g}, ${toString b}, ${toString alpha})";
  
  # Importer et fusionner tous les modules
  modules = with pkgs.lib;
    foldl' recursiveUpdate {} [
      (import ./modules/battery.nix)
      (import ./modules/bluetooth.nix)
      (import ./modules/clock.nix)
      (import ./modules/network.nix)
      (import ./modules/power-profiles-daemon.nix)
      (import ./modules/temperature.nix)
      (import ./modules/lock_screen.nix)
      (import ./modules/power_btn.nix)
      (import ./modules/swaync.nix)
      (import ./modules/microphone.nix)
      (import ./modules/pulseaudio.nix)
      (import ./modules/tray.nix)
      (import ./modules/workspaces.nix)
    ];
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = modules // {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;

        modules-left = [
          "group/hardware"
          "clock"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "network"
          "bluetooth"
          "group/audio"
          "tray"
          "custom/swaync"
          "group/exit"
        ];

        "group/hardware" = {
          orientation = "horizontal";
          modules = [ "temperature" "battery" "power-profiles-daemon" ];
        };
        "group/audio" = {
          orientation = "horizontal";
          modules = [ "pulseaudio" "pulseaudio#microphone" ];
        };
        "group/exit" = {
          orientation = "horizontal";
          modules = [ "custom/power_btn" "custom/lock_screen" ];
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "${config.stylix.fonts.sansSerif.name}", FontAwesome;
          font-weight: bold;
          font-size: 12px;
          min-height: 0;
      }

      window#waybar {
          background-color: rgba(0, 0, 0, 0);
          background: ${hexToRgba config.lib.stylix.colors.base00 0.6};
          color: #${config.lib.stylix.colors.base0D};
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      tooltip {
          background: ${hexToRgba config.lib.stylix.colors.base00 0.85};
          border-radius: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: #${config.lib.stylix.colors.base0D};
      }

      #workspaces {
          background: ${hexToRgba config.lib.stylix.colors.base00 0.6};
          margin: 2px;
          padding: 1px 3px;
          border-radius: 10px;
          border: 1px solid #${config.lib.stylix.colors.base0D};
      }

      #workspaces button {
          padding: 0px 3px;
          margin: 0px 1px;
          border-radius: 8px;
          color: #${config.lib.stylix.colors.base0D};
          background-color: #${config.lib.stylix.colors.base01};
          transition: all 0.2s ease-in-out;
      }

      #workspaces button.empty {
          opacity: 0.4;
      }

      #workspaces button.active {
          color: #${config.lib.stylix.colors.base01};
          background-color: #${config.lib.stylix.colors.base0D};
          border-radius: 8px;
          min-width: 20px;
      }

      #workspaces button.urgent {
          background-color: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base01};
          border-radius: 8px;
          min-width: 20px;
      }

      #workspaces button:hover {
          background-color: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base01};
          border-radius: 8px;
          min-width: 20px;
      }

      #clock,
      #network,
      #bluetooth,
      #window,
      #custom-rofi,
      #custom-power_btn,
      #custom-lock_screen,
      #custom-wol,
      #custom-tailscale,
      #custom-github,
      #custom-media,
      #power-profiles-daemon,
      #temperature,
      #battery,
      #backlight,
      #custom-wl-gammarelay-temperature,
      #pulseaudio,
      #custom-swaync {
          background-color: #${config.lib.stylix.colors.base01};
          padding: 0px 4px;
          border-radius: 10px;
          margin-top: 2px;
          margin-bottom: 2px;
          border: none;
          color: #${config.lib.stylix.colors.base0D};
      }

      /* LEFT MODULES */

      #clock {
          border-radius: 10px;
          color: #${config.lib.stylix.colors.base0D};
          margin-left: 4px;
      }

      #network {
          border-radius: 10px 0 0 10px;
          color: #${config.lib.stylix.colors.base0D};
          margin-left: 4px;
      }

      #network.disabled {
          color: #${config.lib.stylix.colors.base0D};
      }

      #bluetooth {
          border-radius: 0 10px 10px 0;
          color: #${config.lib.stylix.colors.base0D};
          margin-right: 4px;
      }

      #window {
          background: #${config.lib.stylix.colors.base05};
          color: #${config.lib.stylix.colors.base00};
          border-radius: 10px;
          margin-left: 10px;
          margin-right: 10px;
      }

      window#waybar.empty #window {
          background-color: transparent;
      }

      /* CENTER MODULES */

      #custom-rofi {
          opacity: 0.6;
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-power_btn {
          color: #${config.lib.stylix.colors.base0D};
          border-radius: 10px 0 0 10px;
      }

      #custom-lock_screen {
          color: #${config.lib.stylix.colors.base0D};
          border-radius: 0 10px 10px 0;
          padding-right: 8px;
          margin-right: 4px;
      }

      #custom-tailscale,
      #custom-wol {
          border-radius: 0;
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-tailscale.green,
      #custom-wol.green {
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-tailscale.red,
      #custom-wol.red {
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-wol.orange {
          color: #${config.lib.stylix.colors.base0D};
      }

      /* RIGHT MODULES */

      #custom-media {
          padding-right: 8px;
          margin-right: 5px;
          margin-left: 5px;
          color: #${config.lib.stylix.colors.base0D};
      }

      #temperature {
          color: #${config.lib.stylix.colors.base0D};
          border-radius: 10px 0 0 10px;
          margin-left: 4px;
      }

      #temperature.critical {
          color: #${config.lib.stylix.colors.base0D};
      }

      #battery {
          border-radius: 0;
          padding-left: 4px;
          color: #${config.lib.stylix.colors.base0D};
      }

      #battery.warning {
          color: #${config.lib.stylix.colors.base0D};
      }

      #battery.critical {
          color: #${config.lib.stylix.colors.base0D};
      }

      #power-profiles-daemon {
          border-radius: 0 10px 10px 0;
          padding-left: 4px;
          margin-right: 4px;
          color: #${config.lib.stylix.colors.base0D};
      }

      #power-profiles-daemon.power-saver {
          color: #${config.lib.stylix.colors.base0D};
      }

      #power-profiles-daemon.balanced {
          color: #${config.lib.stylix.colors.base0D};
      }

      #power-profiles-daemon.performance {
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-wl-gammarelay-temperature {
          border-radius: 0;
          padding-left: 4px;
          color: #${config.lib.stylix.colors.base0D};
      }

      #backlight {
          border-radius: 0 10px 10px 0;
          margin-right: 4px;
      }

      #pulseaudio {
          border-radius: 10px 0 0 10px;
          color: #${config.lib.stylix.colors.base0D};
      }

      #pulseaudio.microphone {
          border-radius: 0 10px 10px 0;
          color: #${config.lib.stylix.colors.base0D};
          margin-right: 4px;
      }

      #tray {
          background-color: #${config.lib.stylix.colors.base01};
          padding: 0px 4px;
          border-radius: 10px 0 0 10px;
          margin-top: 2px;
          margin-bottom: 2px;
          border: none;
          color: #${config.lib.stylix.colors.base0D};
      }

      #custom-swaync {
          border-radius: 0 10px 10px 0;
          margin-right: 4px;
      }
    '';
  };

  stylix.targets.waybar.enable = false;
}