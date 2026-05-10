#!/usr/bin/env bash
# Interactive troubleshooting guide for eww updates menu

set -euo pipefail

echo "🔧 Eww Updates Menu - Interactive Troubleshooting"
echo "=================================================="
echo

# Function to check and fix permissions
check_and_fix_permissions() {
  local script="$1"
  local script_path="${HOME}/.config/waybar/scripts/$script"
  
  if [ -f "$script_path" ]; then
    if [ ! -x "$script_path" ]; then
      echo "⚙️  Fixing permissions for $script..."
      chmod +x "$script_path"
      echo "✓ Permissions fixed!"
    fi
  fi
}

# Function to test eww daemon
test_eww_daemon() {
  echo "Testing eww daemon startup..."
  
  if ! pgrep -x eww >/dev/null 2>&1; then
    echo "Starting eww daemon..."
    eww daemon &>/dev/null || {
      echo "✗ Failed to start eww daemon"
      echo "Try: eww daemon"
      return 1
    }
    sleep 1
  fi
  echo "✓ Eww daemon is running"
  return 0
}

# Function to test menu
test_menu() {
  echo "Testing menu open/close..."
  
  if eww open updates 2>/dev/null; then
    echo "✓ Menu opened"
    sleep 2
    if eww close updates 2>/dev/null; then
      echo "✓ Menu closed"
      return 0
    else
      echo "⚠ Menu didn't close properly"
      eww close updates 2>/dev/null || true
      return 1
    fi
  else
    echo "✗ Failed to open menu"
    echo "Logs:"
    eww logs 2>&1 | tail -20
    return 1
  fi
}

# Main menu
while true; do
  echo
  echo "Select an option:"
  echo "1) Fix script permissions"
  echo "2) Test eww daemon"
  echo "3) Test menu open/close"
  echo "4) View eww logs"
  echo "5) Run full diagnostic"
  echo "6) Exit"
  echo
  read -rp "Choice [1-6]: " choice
  
  case "$choice" in
    1)
      check_and_fix_permissions "toggle_eww_updates.sh"
      check_and_fix_permissions "run_update.sh"
      check_and_fix_permissions "run_system_update.sh"
      check_and_fix_permissions "run_home_update.sh"
      ;;
    2)
      test_eww_daemon
      ;;
    3)
      if test_eww_daemon; then
        test_menu
      fi
      ;;
    4)
      echo "Eww logs (last 20 lines):"
      eww logs 2>&1 | tail -20 || echo "No logs available"
      ;;
    5)
      bash ~/.config/waybar/scripts/diagnose_eww.sh
      ;;
    6)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
done
