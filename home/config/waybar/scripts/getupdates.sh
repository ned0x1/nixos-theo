#!/usr/bin/env bash

threshold_green=0
threshold_yellow=15
threshold_red=100

updates_arch=0
updates_aur=0

list_updates=""

# ----------------------------
# Arch updates (safe fallback)
# ----------------------------
if command -v checkupdates >/dev/null 2>&1; then
    updates_arch=$(checkupdates 2>/dev/null | wc -l)
    list_updates_arch=$(checkupdates 2>/dev/null)
    list_updates+="$list_updates_arch"
fi

# ----------------------------
# AUR updates (optional)
# ----------------------------
if command -v yay >/dev/null 2>&1; then
    updates_aur=$(yay -Qua 2>/dev/null | wc -l)
    list_updates_aur=$(yay -Qua 2>/dev/null)

    if [ "$updates_arch" -gt 0 ] && [ "$updates_aur" -gt 0 ]; then
        list_updates+="\n"
    fi

    list_updates+="$list_updates_aur"
fi

# ----------------------------
# Total
# ----------------------------
updates=$((updates_arch + updates_aur))

tooltip="Update the System (<span size=\"small\">${updates} packages):"$'\n'"${list_updates}</span>"

# ----------------------------
# Color logic
# ----------------------------
if [ "$updates" -le "$threshold_yellow" ]; then
    css_class="green"
elif [ "$updates" -le "$threshold_red" ]; then
    css_class="yellow"
else
    css_class="red"
fi

# ----------------------------
# Output JSON Waybar
# ----------------------------
jq -nc \
    --arg text "$updates" \
    --arg tooltip "$tooltip" \
    --arg class "$css_class" \
    '{text: $text, tooltip: $tooltip, class: $class}'