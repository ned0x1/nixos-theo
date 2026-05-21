{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nano
    bat
    ripgrep
    tldr
    unzip
    wget
    zip
    file
    gcc
    openssl
    net-tools
    cliphist
    wl-clipboard
  ];
  imports = [
    ./tmux
    ./zsh
    ./micro
  ];
}
