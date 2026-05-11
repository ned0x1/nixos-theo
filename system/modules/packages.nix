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
    yazi
    xdg-desktop-portal-gtk
  ];
}