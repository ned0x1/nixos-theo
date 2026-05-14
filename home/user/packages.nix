{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # — Développement —
    jq
    nixd
    (python3.withPackages (ps: with ps; [
      requests
    ]))

    # — Travail —
    obsidian
    thunderbird

    # — Outils CLI —
    eza
    fzf
    zoxide
    lm_sensors
    nano
    nitch
    ripgrep
    tldr
    unzip
    wget
    zip
    file
    yazi
    zsh

    # — Utilitaires utilisateur —
    viewnior

  ];
}