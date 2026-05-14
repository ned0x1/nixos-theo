{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # — Compilateurs / Build —
    gcc
    openssl
    ncdu

    # — Network —
    mtr
    net-tools


    # — Bureau / Fichiers —
    xdg-desktop-portal-gtk
  ];
}