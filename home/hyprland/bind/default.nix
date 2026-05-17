{ ... }:
let
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # --- APPS ---
      "${mainMod}, T, exec, kitty"
      "${mainMod}, E, exec, kitty --class yazi -e yazi"
      "${mainMod}, A, exec, rofi -show drun"
      "${mainMod}, G, exec, firefox"
      "${mainMod}, c, exec, telegram-desktop"
      # --- SYSTEM ---
      "${mainMod}, Q, killactive"
      "${mainMod} CTRL, L, exec, sleep 1 && hyprlock"
      "${mainMod}, L, exit"
      "${mainMod}, M, exec, wlogout --protocol layer-shell"
      "${mainMod}, Return, fullscreen"
      # --- WINDOWS ---
      "${mainMod}, W, togglefloating"
      "${mainMod}, B, pseudo"
      # --- SCREENSHOT ---
      "${mainMod}, P, exec, hyprshot -m region --clipboard"
      "${mainMod} CTRL, right, workspace, +1"
      "${mainMod} CTRL, left, workspace, -1"
      "${mainMod} ALT, right, movetoworkspace, +1"
      "${mainMod} ALT, left, movetoworkspace, -1"
      # --- RESIZE ---
      "${mainMod} CTRL, l, resizeactive, 10 0"
      "${mainMod} CTRL, h, resizeactive, -10 0"
      "${mainMod} CTRL, k, resizeactive, 0 -10"
      "${mainMod} CTRL, j, resizeactive, 0 10"
      # --- POWER PROFILES ---
      ", XF86Launch5, exec, powerprofilesctl cycle"
    ];

    bindm = [
      # --- MOUSE ---
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
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
