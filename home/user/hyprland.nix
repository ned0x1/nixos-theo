{ pkgs, ... }:

{
    home.packages = with pkgs; [
      hyprpaper
      hyprshot
      swaynotificationcenter
      kitty
      swayidle
      swaylock-effects
      wlogout
      wofi
      waybar
      pamixer
    ];

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
