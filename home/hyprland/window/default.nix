{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 2;
        passes = 2;
        new_optimizations = true;
        xray = false;
      };
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "overshot, 0.05, 0.9, 0.1, 1.05"
        "smoothOut, 0.36, 0, 0.66, -0.56"
        "smoothIn, 0.25, 1, 0.5, 1"
      ];
      animation = [
        "windows, 1, 5, overshot, slide"
        "windowsOut, 1, 4, smoothOut, slide"
        "windowsMove, 1, 4, default"
        "border, 1, 10, default"
        "fade, 1, 10, smoothIn"
        "fadeDim, 1, 10, smoothIn"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
    };

    gesture = [
      "3, horizontal, workspace"
    ];
  };
}
