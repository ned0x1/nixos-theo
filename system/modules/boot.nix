{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 30;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    theme = "spinner";
  };

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
  ];

  console.keyMap = lib.mkForce "fr";

}
