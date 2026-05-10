{ config, username, homeManagerStateVersion, pkgs, lib, home-manager, ... }:
{
  imports = [ ./user ];
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = homeManagerStateVersion;
  programs.home-manager.enable = true;

  home.packages = [
    home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager 
  ];
}