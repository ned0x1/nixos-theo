{ pkgs, lib, ... }:
let
  configDir = ../config;
in
{
  home.packages = with pkgs; [
    hyprshot
    swaynotificationcenter
    kitty
    wlogout
    wofi
    waybar
    bibata-cursors
  ];

  home.file = {
    ".config/hypr/bind.conf".source = "${configDir}/hypr/bind.conf";
    ".config/hypr/exec.conf".source = "${configDir}/hypr/exec.conf";
    ".config/hypr/input.conf".source = "${configDir}/hypr/input.conf";
    ".config/hypr/monitor.conf".source = "${configDir}/hypr/monitor.conf";
    ".config/hypr/window.conf".source = "${configDir}/hypr/window.conf";
    ".config/hypr/windowrule.conf".source = "${configDir}/hypr/windowrule.conf";
  };

  services.swaync.enable = true;

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "${pkgs.hyprlock}/bin/hyprlock";
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 420;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    settings = {
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,16"
      ];
    };

    extraConfig = ''
      source = ~/.config/hypr/monitor.conf
      source = ~/.config/hypr/exec.conf
      source = ~/.config/hypr/bind.conf
      source = ~/.config/hypr/input.conf
      source = ~/.config/hypr/window.conf
      source = ~/.config/hypr/windowrule.conf
    '';
  };
}
