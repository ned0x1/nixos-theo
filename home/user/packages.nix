{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # — Développement —
    eww
    jq
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
    yazi

    # — Utilitaires utilisateur —
    viewnior

  ];
}