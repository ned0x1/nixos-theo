{ config, pkgs, ... }: 

{

    xdg.portal = {
      enable = true;
      wlr.enable = false;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };

    programs.dconf.enable = true;

    programs.hyprland.enable = true;

    programs.bash.enable = true;

}
