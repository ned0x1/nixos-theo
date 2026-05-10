#!/usr/bin/env bash
set -euo pipefail

EWW_CMD=$(command -v eww || true)
[ -n "$EWW_CMD" ] || { echo "eww not found" >&2; exit 1; }

# start daemon if not running
if ! pgrep -x eww >/dev/null 2>&1; then
  "$EWW_CMD" daemon &>/dev/null || true
  sleep 0.05
fi

if "$EWW_CMD" windows 2>/dev/null | grep -q "updates"; then
  "$EWW_CMD" close updates
else
  "$EWW_CMD" open updates
fi

exit 0
