{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # — Développement —
    eww
    wev
    (python3.withPackages (ps: with ps; [
      requests
    ]))

    # — Travail —
    obsidian
    thunderbird
    vscode

    # — Outils CLI —
    bat
    btop
    eza
    fastfetch
    fzf
    git
    zoxide
    lm_sensors
    nano
    ripgrep
    tldr
    unzip
    wget
    zip
    file

    # — Interface / Thème —
    zsh-powerlevel10k
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders

    # — Bureau Hyprland —
    hyprpaper
    hyprshot
    swaynotificationcenter

    # — Social —
    discord

    # — Utilitaires utilisateur —
    viewnior
  ];
}