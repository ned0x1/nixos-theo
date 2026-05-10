#!/usr/bin/env bash

threshold_green=0
threshold_yellow=5
threshold_red=10

updates=0

# --------------------------
# NixOS flake updates check
# --------------------------
flake_dir="$HOME/Documents/nixos-theo"
if [ -d "$flake_dir/.git" ]; then
    cd "$flake_dir"
    # Vérifier s'il y a des updates disponibles
    if nix flake update --dry-run &>/dev/null; then
        updates=1
    fi
fi

# ----------------------------
# Color logic
# ----------------------------
if [ "$updates" -eq 0 ]; then
    css_class="green"
else
    css_class="yellow"
fi

# ----------------------------
# Output JSON Waybar
# ----------------------------
tooltip="NixOS flake: Mises à jour disponibles. Clique pour installer."
if [ "$updates" -eq 0 ]; then
    tooltip="NixOS flake: Système à jour."
fi

jq -nc \
    --arg text "$updates" \
    --arg tooltip "$tooltip" \
    --arg class "$css_class" \
    '{text: $text, tooltip: $tooltip, class: $class}'