{ pkgs, ... }:
{
  services.swaync.enable = true;

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprpaper - Wallpaper utility for Hyprland";
      Documentation = "https://github.com/hyprwm/hyprpaper";
      PartOf = "graphical-session.target";
      After = "graphical-session-pre.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "/bin/sh -c '${pkgs.coreutils}/bin/sleep 1 && ${pkgs.hyprpaper}/bin/hyprpaper --config ~/.config/hypr/hyprpaper.conf'";
      ExecStartPost = "${pkgs.coreutils}/bin/sleep 1.5 && ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper \"eDP-1,$HOME/.config/wallpapers/wall.png\"";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}