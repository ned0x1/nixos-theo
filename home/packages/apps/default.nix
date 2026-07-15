{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    thunderbird
    pavucontrol
  ];
  imports = [
    ./btop
    ./firefox
    ./keepassXC
    ./kitty
    ./nixcord
    ./vscode
  ];
}
