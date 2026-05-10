{ config, username, homeManagerStateVersion, pkgs, lib, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = homeManagerStateVersion;
}


