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

    # — Qt5 —
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg

    # — Bureau / Fichiers —
    blueman
    thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}