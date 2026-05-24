{
  config,
  pkgs,
  lib,
  ...
}:
{

  programs.regreet = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    settings = {
      background = {
        path = ../../lib/wallpapers/lowpoly_street.png;
        fit = "Cover";
      };
      env.default_user = "theo";
    };
  };

  environment.variables = {
    GSK_RENDERER = "ngl";
    XKB_DEFAULT_LAYOUT = "fr";
  };
}
