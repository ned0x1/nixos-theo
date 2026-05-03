{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = "theo";
  home.homeDirectory = "/home/theo";
  home.stateVersion = "25.11";
}

