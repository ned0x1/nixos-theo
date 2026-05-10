{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
      hyprpaper
      hyprshot
      swaynotificationcenter
      kitty
      libnotify
      mako
      qt5.qtwayland
      qt6.qtwayland
      swayidle
      swaylock-effects
      wlogout
      wl-clipboard
      wofi
      waybar
      home-manager
      
    ];
}
