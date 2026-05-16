{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nano
    ripgrep
    tldr
    unzip
    wget
    zip
    file
    gcc
    openssl
    net-tools
  ];
  imports = [
    ./bat
    ./tmux
    ./zsh
  ];
}
