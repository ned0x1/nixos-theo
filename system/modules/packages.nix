{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # — Compilateurs / Build —
    gcc
    openssl

    # — Network —
    mtr
    net-tools


    # — Bureau / Fichiers —
    blueman
    thunar
    xdg-desktop-portal-gtk
  ];
}