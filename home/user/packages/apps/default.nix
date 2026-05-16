{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    thunderbird
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
