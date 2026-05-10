#!/usr/bin/env bash
echo "Installation des mises à jour..."
sudo nixos-rebuild switch --flake .#pc-portable --show-trace