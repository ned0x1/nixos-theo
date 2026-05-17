{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float 1, match:class file_progress"
      "float 1, match:class confirm"
      "float 1, match:class dialog"
      "float 1, match:class download"
      "float 1, match:class notification"
      "float 1, match:class error"
      "float 1, match:class splash"
      "float 1, match:class confirmreset"
      "float 1, match:title Open File"
      "float 1, match:title branchdialog"
      "float 1, match:class ^$"
      "float 1, match:class file-roller"
      "fullscreen 1, match:class wlogout"
      "float 1, match:title wlogout"
      "float 1, match:title Media viewer"
      "float 1, match:title Picture-in-Picture"
      "pin 1, match:title Picture-in-Picture"
      "float 1, match:class vesktop, match:title Discord Popout"
      "pin 1, match:class vesktop, match:title Discord Popout"
      "opacity 0.9 override 0.9 override, match:title btop"
      "float 1, match:title exegol-history"
      "size 900 450, match:title exegol-history"
      "center 1, match:title exegol-history"
    ];
  };
}
