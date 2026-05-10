{ config, pkgs, ... }:

let
  sddmTheme = import ./sddm-theme.nix { inherit pkgs; };
in
{
  services = {
    dbus.enable = true;
    openssh.enable = false;
    power-profiles-daemon.enable = true;

    xserver = {
      enable = true;
      xkb.layout = "fr";
    };
    displayManager.sddm = {
        enable = true;
        theme = "astronaut";
    };
  };

  environment.systemPackages = [
    sddmTheme
  ];

}