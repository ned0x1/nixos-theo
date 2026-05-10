#!/usr/bin/env bash
set -euo pipefail

EWW_CMD=$(command -v eww || true)
[ -n "$EWW_CMD" ] || { echo "eww not found" >&2; exit 1; }

# start daemon if not running
if ! pgrep -x eww >/dev/null 2>&1; then
  "$EWW_CMD" daemon &>/dev/null || true
  sleep 0.05
fi

# Check if window is already open
if "$EWW_CMD" windows 2>/dev/null | grep -q "updates"; then
  "$EWW_CMD" close updates
else
  # Get cursor position (relative to current screen in wayland)
  # This is a safe fallback that positions the menu center-top
  # For more advanced positioning, you might need to use additional tools
  "$EWW_CMD" open updates --arg x="50%" --arg y="30px"
fi

exit 0
