{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # — Compilateurs / Build —
    gcc
    openssl

    # — Network —
    mtr

    # — Bureau / Fichiers —
    blueman
    thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}