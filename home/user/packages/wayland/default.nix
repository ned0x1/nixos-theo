{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
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
