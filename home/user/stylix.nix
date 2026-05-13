{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../config/wallpapers/wall.png; 
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    
    polarity = "dark";
    
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
    };
  };

  home.packages = with pkgs; [
    font-awesome
  ];
}
