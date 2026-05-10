#!/bin/sh
# Hyprpaper startup script with proper delay handling

# Wait for hyprland/wayland to fully initialize
sleep 1

# Start hyprpaper
hyprpaper --config ~/.config/hypr/hyprpaper.conf &

# Wait for hyprpaper to load wallpapers
sleep 1.5

# Apply wallpaper via hyprctl
hyprctl hyprpaper wallpaper "eDP-1,${HOME}/.config/wallpapers/wall.png"
