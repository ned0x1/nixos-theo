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
    samba
  ];
  imports = [
    ./tmux
    ./zsh
    ./micro
  ];
}
