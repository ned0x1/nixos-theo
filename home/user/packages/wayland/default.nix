{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    swaynotificationcenter
    bibata-cursors
  ];
  imports = [
    ./hyprlock
    ./mako
    ./rofi
    ./waybar
    ./wlogout
  ];
}
