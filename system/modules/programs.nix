{ config, pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.wireshark.enable = true;
  programs.hyprland.enable = true;
}
