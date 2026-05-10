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
      
    ];
}
