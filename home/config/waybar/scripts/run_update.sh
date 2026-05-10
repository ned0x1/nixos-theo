#!/usr/bin/env bash
# Wrapper script to handle updates from eww menu
# Usage: ./run_update.sh system|home

set -euo pipefail

UPDATE_TYPE="${1:-home}"

# Close the eww window
if command -v eww &>/dev/null; then
  eww close updates 2>/dev/null || true
fi

case "$UPDATE_TYPE" in
  system)
    /home/theo/.config/waybar/scripts/run_system_update.sh
    ;;
  home)
    /home/theo/.config/waybar/scripts/run_home_update.sh
    ;;
  *)
    echo "Invalid update type: $UPDATE_TYPE" >&2
    exit 1
    ;;
esac

exit 0
