#!/usr/bin/env bash
set -euo pipefail

OPTIONS="Système\nHome"

if command -v wofi >/dev/null 2>&1; then
	MENU=$(printf "%b" "$OPTIONS" | wofi --show dmenu -p "Mises à jour" 2>/dev/null || true)
elif command -v dmenu >/dev/null 2>&1; then
	MENU=$(printf "%b" "$OPTIONS" | dmenu -p "Mises à jour" || true)
else
	printf "%b" "$OPTIONS"
	read -rp "Choix (tapez Système ou Home): " MENU
fi

[ -z "$MENU" ] && exit 0

case "$MENU" in
	"Système")
		ACTION='cd ~/Documents/nixos-theo && sudo nixos-rebuild switch --flake .#pc-portable --show-trace'
		TITLE='Mises à jour — Système'
		;;
	"Home")
		ACTION='cd ~/Documents/nixos-theo && home-manager switch --flake .#theo --impure'
		TITLE='Mises à jour — Home'
		;;
	*)
		exit 0
		;;
esac

kitty --title "$TITLE" bash -lc "$ACTION; echo; read -rp 'Appuyez sur Entrée pour fermer...' -r" &

exit 0