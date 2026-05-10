#!/usr/bin/env bash
set -euo pipefail
cd ~/Documents/nixos-theo || exit 1
kitty --title "Mises à jour — Home" bash -lc "cd ~/Documents/nixos-theo && home-manager switch --flake .#theo --impure; echo; read -rp 'Appuyez sur Entrée pour fermer...' -r" &
