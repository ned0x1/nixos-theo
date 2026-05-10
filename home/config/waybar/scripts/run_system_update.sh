#!/usr/bin/env bash
set -euo pipefail
cd ~/Documents/nixos-theo || exit 1
kitty --title "Mises à jour — Système" bash -lc "cd ~/Documents/nixos-theo && sudo nixos-rebuild switch --flake .#pc-portable --show-trace; echo; read -rp 'Appuyez sur Entrée pour fermer...' -r" &
