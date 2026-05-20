{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./modules
  ];

  system.stateVersion = "25.11";
}
