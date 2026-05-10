#!/usr/bin/env bash

# Afficher tous les paquets configurés en Nix (cherche dans tous les fichiers)
{
    echo "=== SYSTEM PACKAGES ==="
    find ~/Documents/nixos-theo/system -name "*.nix" -exec sed -n '/environment.systemPackages/,/\];/p' {} \; | grep -oE '^\s+[a-zA-Z0-9._-]+' | sed 's/^\s*//' | grep -v '^$' | sort -u | sed 's/^/[SYS] /'
    
    echo ""
    echo "=== HOME-MANAGER PACKAGES ==="
    find ~/Documents/nixos-theo/home/user -name "*.nix" -exec sed -n '/home.packages/,/\];/p' {} \; | grep -oE 'pkgs\.[a-zA-Z0-9._-]+|python-pkgs\.[a-zA-Z0-9._-]+' | sed 's/pkgs\.//g' | sed 's/python-pkgs\.//g' | grep -v '^$' | sort -u | sed 's/^/[HOME] /'
} | fzf --layout=reverse