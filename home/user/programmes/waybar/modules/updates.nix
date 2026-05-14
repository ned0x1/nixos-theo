{ pkgs, ... }: {
  "custom/updates" = {
    format = " ";
    escape = false;
    return-type = "json";
    on-click = "${pkgs.writeShellScript "toggle-eww-updates" ''
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

      # Toggle windows
      if "$EWW_CMD" windows 2>/dev/null | grep -q "updates"; then
        "$EWW_CMD" close updates
        "$EWW_CMD" close updates-overlay
      else
        "$EWW_CMD" open updates-overlay
        "$EWW_CMD" open updates
      fi

      exit 0
    ''}";
    on-click-right = "kitty --title 'Installed Packages' -e ${pkgs.writeShellScript "listpackages" ''
      #!/usr/bin/env bash

      # Afficher tous les paquets configurés en Nix
      {
          echo "=== SYSTEM PACKAGES ==="
          find $HOME/Documents/nixos-theo/system -name "*.nix" -exec sed -n "/environment.systemPackages/,/\];/p" {} \; | grep -oE "^\s+[a-zA-Z0-9._-]+" | sed "s/^\s*//" | grep -v "^$" | sort -u | sed "s/^/[SYS] /"
          
          echo ""
          echo "=== HOME-MANAGER PACKAGES ==="
          find $HOME/Documents/nixos-theo/home/user -name "*.nix" -exec sed -n "/home.packages/,/\];/p" {} \; | grep -oE "pkgs\.[a-zA-Z0-9._-]+|python-pkgs\.[a-zA-Z0-9._-]+" | sed "s/pkgs\.//g" | sed "s/python-pkgs\.//g" | grep -v "^$" | sort -u | sed "s/^/[HOME] /"
      } | ${pkgs.fzf}/bin/fzf --layout=reverse
    ''}";
    tooltip-format = "Updates";
    tooltip = true;
  };
}
