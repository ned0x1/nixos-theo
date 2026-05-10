{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # — Compilateurs / Build —
    gcc
    openssl

    # — Network —
    mtr

    # — Outils CLI —
    nano
    ripgrep
    tldr
    unzip
    wget
    zip
    file

    # — Bureau / Fichiers —
    blueman
    thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}