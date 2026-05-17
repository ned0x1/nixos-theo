{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    bibata-cursors
  ];
  imports = [
    ./hyprlock
    ./mako
    ./rofi
    ./waybar
    ./wlogout
    ./yazi
  ];
}
