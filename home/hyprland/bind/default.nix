{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # --- APPS ---
      "SUPER, T, exec, kitty"
      "SUPER, E, exec, kitty --class yazi -e yazi"
      "SUPER, A, exec, rofi -show drun"
      "SUPER, G, exec, firefox"
      "SUPER, c, exec, telegram-desktop"
      # --- SYSTEM ---
      "SUPER, Q, killactive"
      "SUPER CTRL, L, exec, sleep 1 && hyprlock"
      "SUPER, L, exit"
      "SUPER, M, exec, wlogout --protocol layer-shell"
      "SUPER, Return, fullscreen"
      # --- WINDOWS ---
      "SUPER, W, togglefloating"
      "SUPER, B, pseudo"
      # --- SCREENSHOT ---
      "SUPER, P, exec, hyprshot -m region --clipboard"
      "SUPER CTRL, right, workspace, +1"
      "SUPER CTRL, left, workspace, -1"
      "SUPER ALT, right, movetoworkspace, +1"
      "SUPER ALT, left, movetoworkspace, -1"
      # --- RESIZE ---
      "SUPER CTRL, l, resizeactive, 10 0"
      "SUPER CTRL, h, resizeactive, -10 0"
      "SUPER CTRL, k, resizeactive, 0 -10"
      "SUPER CTRL, j, resizeactive, 0 10"
      # --- POWER PROFILES ---
      ", XF86Launch5, exec, powerprofilesctl cycle"
    ];
    bindm = [
      # --- MOUSE ---
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
    bindel = [
      # --- AUDIO & VOLUME ---
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
      # --- BRIGHTNESS ---
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ];
  };
}
