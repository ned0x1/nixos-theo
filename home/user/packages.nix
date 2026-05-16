{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # — Développement —
    jq
    nixd
    (python3.withPackages (
      ps: with ps; [
        requests
      ]
    ))

    # — Travail —
    obsidian
    thunderbird

    # — Outils CLI —

    nano
    ripgrep
    tldr
    unzip
    wget
    zip
    file
    gcc
    openssl

    # — Network —
    net-tools

  ];
}
