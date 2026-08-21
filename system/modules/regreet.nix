{
  config,
  pkgs,
  lib,
  ...
}:
{

  services.displayManager.regreet = {
    enable = true;
    settings = {
      background = {
        path = ../../lib/wallpapers/lowpoly_street.png;
        fit = "Cover";
      };
      env.default_user = "theo";
    };
  };

  stylix.targets.regreet.enable = true;

  environment.variables = {
    GSK_RENDERER = "ngl";
    XKB_DEFAULT_LAYOUT = "fr";
  };
}
