#!/usr/bin/env bash
# Setup script to apply fixes and test the eww updates menu

set -euo pipefail

echo "🚀 Eww Updates Menu - Setup & Verification"
echo "==========================================="
echo

WAYBAR_SCRIPTS="${HOME}/.config/waybar/scripts"
EWW_CONFIG="${HOME}/.config/eww"

# Step 1: Ensure directories exist
echo "Step 1: Ensuring directories exist..."
mkdir -p "$WAYBAR_SCRIPTS"
mkdir -p "$EWW_CONFIG"
echo "✓ Directories ready"
echo

# Step 2: Fix permissions
echo "Step 2: Setting script permissions..."
scripts_to_fix=(
  "toggle_eww_updates.sh"
  "run_update.sh"
  "run_system_update.sh"
  "run_home_update.sh"
  "diagnose_eww.sh"
  "troubleshoot_eww.sh"
)

for script in "${scripts_to_fix[@]}"; do
  if [ -f "$WAYBAR_SCRIPTS/$script" ]; then
    chmod +x "$WAYBAR_SCRIPTS/$script"
    echo "  ✓ $script is executable"
  fi
done
echo

# Step 3: Verify eww is installed
echo "Step 3: Checking eww installation..."
if command -v eww &>/dev/null; then
  eww_version=$(eww --version 2>/dev/null || echo "unknown version")
  echo "  ✓ eww is installed ($eww_version)"
else
  echo "  ✗ eww is NOT installed!"
  echo "  You need to add 'pkgs.eww' to your home/user/packages.nix and rebuild"
  exit 1
fi
echo

# Step 4: Verify configuration files
echo "Step 4: Checking eww configuration files..."
required_files=(
  "updates.yuck"
  "eww.scss"
)

for file in "${required_files[@]}"; do
  if [ -f "$EWW_CONFIG/$file" ]; then
    echo "  ✓ $file exists"
  else
    echo "  ✗ $file is missing!"
    exit 1
  fi
done
echo

# Step 5: Kill and restart eww daemon
echo "Step 5: Restarting eww daemon..."
pkill -x eww 2>/dev/null || true
sleep 0.5
eww daemon &>/dev/null || true
sleep 0.5

if pgrep -x eww >/dev/null 2>&1; then
  echo "  ✓ Eww daemon is running"
else
  echo "  ⚠ Eww daemon failed to start"
  echo "  Try manually: eww daemon"
fi
echo

# Step 6: Test menu
echo "Step 6: Testing menu..."
if eww open updates 2>/dev/null; then
  echo "  ✓ Menu opens successfully!"
  sleep 1
  eww close updates 2>/dev/null || true
  echo "  ✓ Menu closes successfully!"
else
  echo "  ✗ Failed to open menu"
  echo "  Run: eww logs --follow"
  exit 1
fi
echo

# Step 7: Final instructions
echo "==========================================="
echo "✅ Setup Complete!"
echo
echo "What to do next:"
echo "1. Click on the updates icon in waybar"
echo "2. The menu should appear near the top-center"
echo "3. Click 'Système' or 'Home' to run updates"
echo "4. A terminal should open with the logs"
echo
echo "If something doesn't work:"
echo "  → Run: bash $WAYBAR_SCRIPTS/diagnose_eww.sh"
echo "  → Or: bash $WAYBAR_SCRIPTS/troubleshoot_eww.sh"
echo
echo "To view eww logs:"
echo "  → eww logs --follow"
echo
echo "==========================================="
