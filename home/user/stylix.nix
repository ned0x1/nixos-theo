{
  stylix = {
    enable = true;
    image = ../config/wallpapers/your-wallpaper.png; # À adapter avec ton wallpaper
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml"; # Ou ton thème
    
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono-nerd-font;
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
}
