{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      hyprshot
      swaynotificationcenter
      kitty
      swayidle
      swaylock-effects
      wlogout
      wofi
      waybar
    ];

    services.swaync.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;

        xwayland.enable = true;

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
