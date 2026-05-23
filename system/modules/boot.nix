{
  config,
  pkgs,
  lib,
  ...
}:

{

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
