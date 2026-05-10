{ pkgs, lib, ... }:
{
  services.swaync.enable = true;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/theo/.config/wallpapers/wall.png" ];
      wallpaper = [{
        monitor = "eDP-1";
        path = "/home/theo/.config/wallpapers/wall.png";
      }];
      ipc = "on";
      splash = false;
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce [ "graphical-session.target" ];
}