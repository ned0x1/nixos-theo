{ lib, ... }:
let
  mainMod = "SUPER";
  lua = lib.generators.mkLuaInline;
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';

  mkBind = key: dispatcher: flags: {
    _args = [
      key
      (lua dispatcher)
    ]
    ++ lib.optional (flags != { }) flags;
  };
  bind = key: dispatcher: mkBind key dispatcher { };
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # --- APPS ---
      (bind "${mainMod} + T" (exec "kitty"))
      (bind "${mainMod} + E" (exec "kitty --class yazi -e yazi"))
      (bind "${mainMod} + A" (exec "rofi -show drun"))
      (bind "ALT + SHIFT + C" (exec "cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

      # --- SYSTEM ---
      (bind "${mainMod} + Q" "hl.dsp.window.close()")
      (bind "CTRL + ALT + Q" (exec "hyprlock"))
      (bind "${mainMod} + L" "hl.dsp.exit()")
      (bind "${mainMod} + Return" "hl.dsp.window.fullscreen({ mode = 0 })")

      # --- WINDOWS ---
      (bind "${mainMod} + W" ''hl.dsp.window.float({ action = "toggle" })'')

      # --- SCREENSHOT ---
      (bind "${mainMod} + P" (exec "hyprshot -m region --clipboard"))

      # --- WORKSPACES ---
      (bind "${mainMod} + CTRL + right" ''hl.dsp.focus({ workspace = "+1" })'')
      (bind "${mainMod} + CTRL + left" ''hl.dsp.focus({ workspace = "-1" })'')
      (bind "${mainMod} + ALT + right" ''hl.dsp.window.move({ workspace = "+1" })'')
      (bind "${mainMod} + ALT + left" ''hl.dsp.window.move({ workspace = "-1" })'')

      # --- POWER PROFILES ---
      (bind "XF86Launch5" (exec "powerprofilesctl cycle"))

      # --- SCROLL WORKSPACES ---
      (bind "${mainMod} + mouse_down" ''hl.dsp.focus({ workspace = "+1" })'')
      (bind "${mainMod} + mouse_up" ''hl.dsp.focus({ workspace = "-1" })'')

      # --- MOUSE (ex-bindm) ---
      (mkBind "${mainMod} + mouse:272" "hl.dsp.window.drag()" { mouse = true; })
      (mkBind "${mainMod} + mouse:273" "hl.dsp.window.resize()" { mouse = true; })

      # --- AUDIO & VOLUME (ex-bindel) ---
      (mkBind "XF86AudioMute" (exec "pamixer -t") {
        locked = true;
        repeating = true;
      })
      (mkBind "XF86AudioLowerVolume" (exec "pamixer -d 5") {
        locked = true;
        repeating = true;
      })
      (mkBind "XF86AudioRaiseVolume" (exec "pamixer -i 5") {
        locked = true;
        repeating = true;
      })
      (mkBind "XF86AudioMicMute" (exec "pamixer --default-source -t") {
        locked = true;
        repeating = true;
      })

      # --- BRIGHTNESS (ex-bindel) ---
      (mkBind "XF86MonBrightnessDown" (exec "brightnessctl set 5%-") {
        locked = true;
        repeating = true;
      })
      (mkBind "XF86MonBrightnessUp" (exec "brightnessctl set 5%+") {
        locked = true;
        repeating = true;
      })
    ];
  };
}
