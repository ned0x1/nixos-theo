#!/usr/bin/env bash
set -euo pipefail

EWW_CMD=$(command -v eww || true)
[ -n "$EWW_CMD" ] || { echo "eww not found" >&2; exit 1; }

# Start daemon if not running
if ! pgrep -x eww >/dev/null 2>&1; then
  "$EWW_CMD" daemon &>/dev/null || true
  sleep 0.5
fi

# Reload config to ensure latest changes are loaded
"$EWW_CMD" reload 2>/dev/null || true

# Toggle window
if "$EWW_CMD" windows 2>/dev/null | grep -q "updates"; then
  "$EWW_CMD" close updates
else
  "$EWW_CMD" open updates
fi

exit 0
