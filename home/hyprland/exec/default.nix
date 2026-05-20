{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "exec-once" = [
      "dbus-update-activation-environment --systemd --all"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "polkit-gnome-authentication-agent-1"
      "waybar"
      "swayidle -w"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];
  };
}
