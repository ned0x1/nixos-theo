{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  exec = cmd: ''hl.exec_cmd("${cmd}")'';

  # regroupe une liste de commandes shell dans une seule fonction
  # déclenchée à l'événement donné (ex: "hyprland.start")
  onEvent = event: cmds: {
    _args = [
      event
      (lua ''
        function()
          ${lib.concatMapStringsSep "\n          " exec cmds}
        end
      '')
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    on = [
      (onEvent "hyprland.start" [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "polkit-gnome-authentication-agent-1"
        "waybar"
        "swayidle -w"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ])
    ];
  };
}
