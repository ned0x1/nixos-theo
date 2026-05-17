{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../lib/wallpapers/lowpoly_street.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets.qt.enable = false;

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
