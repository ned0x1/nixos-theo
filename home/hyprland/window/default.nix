{ ... }:
let
  curve = name: points: {
    _args = [
      name
      {
        type = "bezier";
        inherit points;
      }
    ];
  };
  anim = attrs: { _args = [ attrs ]; };
  gest = attrs: { _args = [ attrs ]; };
in
{
  wayland.windowManager.hyprland.settings = {
    config = {
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
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };
    };

    curve = [
      (curve "overshot" [
        [
          0.05
          0.9
        ]
        [
          0.1
          1.05
        ]
      ])
      (curve "smoothOut" [
        [
          0.36
          0
        ]
        [
          0.66
          (-0.56)
        ]
      ])
      (curve "smoothIn" [
        [
          0.25
          1
        ]
        [
          0.5
          1
        ]
      ])
    ];

    animation = [
      (anim {
        leaf = "windows";
        enabled = true;
        speed = 5;
        bezier = "overshot";
        style = "slide";
      })
      (anim {
        leaf = "windowsOut";
        enabled = true;
        speed = 4;
        bezier = "smoothOut";
        style = "slide";
      })
      (anim {
        leaf = "windowsMove";
        enabled = true;
        speed = 4;
        bezier = "default";
      })
      (anim {
        leaf = "border";
        enabled = true;
        speed = 10;
        bezier = "default";
      })
      (anim {
        leaf = "fade";
        enabled = true;
        speed = 10;
        bezier = "smoothIn";
      })
      (anim {
        leaf = "fadeDim";
        enabled = true;
        speed = 10;
        bezier = "smoothIn";
      })
      (anim {
        leaf = "workspaces";
        enabled = true;
        speed = 6;
        bezier = "default";
      })
    ];

    gesture = [
      (gest {
        fingers = 3;
        direction = "horizontal";
        action = "workspace";
      })
    ];
  };
}
