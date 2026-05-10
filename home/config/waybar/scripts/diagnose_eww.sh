#!/usr/bin/env bash
# Diagnostic script for eww updates menu

echo "🔍 Eww Updates Menu Diagnostic"
echo "======================================"
echo

# Check eww installation
echo "1. Checking eww installation..."
if command -v eww &>/dev/null; then
  eww_version=$(eww --version 2>/dev/null || echo "unknown")
  echo "✓ eww is installed: $eww_version"
else
  echo "✗ eww is NOT installed"
  exit 1
fi
echo

# Check configuration files
echo "2. Checking configuration files..."
eww_config="${HOME}/.config/eww"

files=(
  "updates.yuck"
  "eww.scss"
)

for file in "${files[@]}"; do
  if [ -f "$eww_config/$file" ]; then
    echo "✓ $file exists"
  else
    echo "✗ $file missing"
  fi
done
echo

# Check script files
echo "3. Checking script files..."
scripts=(
  "toggle_eww_updates.sh"
  "run_update.sh"
  "run_system_update.sh"
  "run_home_update.sh"
)

waybar_scripts="${HOME}/.config/waybar/scripts"
for script in "${scripts[@]}"; do
  script_path="$waybar_scripts/$script"
  if [ -f "$script_path" ]; then
    if [ -x "$script_path" ]; then
      echo "✓ $script is executable"
    else
      echo "⚠ $script exists but is NOT executable"
      echo "  Fix: chmod +x $script_path"
    fi
  else
    echo "✗ $script missing"
  fi
done
echo

# Test eww daemon
echo "4. Testing eww daemon..."
if pgrep -x eww >/dev/null 2>&1; then
  echo "✓ eww daemon is running"
else
  echo "ℹ eww daemon is not running (will start on first click)"
fi
echo

# Test opening the menu
echo "5. Testing menu opening..."
echo "Attempting to open updates window..."
if eww open updates 2>/dev/null; then
  echo "✓ Menu opened successfully"
  sleep 1
  if eww close updates 2>/dev/null; then
    echo "✓ Menu closed successfully"
  else
    echo "⚠ Failed to close menu"
  fi
else
  echo "✗ Failed to open menu"
  echo "  Check: eww logs --follow"
fi
echo

echo "======================================"
echo "Diagnostic complete!"
