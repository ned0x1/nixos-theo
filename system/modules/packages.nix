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
    yazi
    xdg-desktop-portal-gtk
  ];
}