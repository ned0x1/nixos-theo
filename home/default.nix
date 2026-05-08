{ config, pkgs, lib, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = "theo";
  home.homeDirectory = "/home/theo";
}


