{ pkgs, lib, ... }:
{
  imports = [
    ./bind
    ./exec
    ./input
    ./window
    ./windowrule
  ];

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
    configType = "hyprlang";
    settings = {
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,16"
      ];
      xwayland.force_zero_scaling = true;
    };
  };
}
