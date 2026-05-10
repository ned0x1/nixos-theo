{ pkgs, ... }:

{
    services.swaync.enable = true;

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "~/.config/wallpapers/wall.png"
        ];
        wallpaper = [
          "eDP-1,~/.config/wallpapers/wall.png"
        ];
        splash = false;
      };
    };
}