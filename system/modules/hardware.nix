{ config, pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
