let configDir = ../config;
in
{
  home.file = {
      ".config/wallpapers" = {
        source = "${configDir}/wallpapers";
        recursive = true;
      };
      ".config/kitty".source = "${configDir}/kitty";
      ".config/neofetch".source = "${configDir}/neofetch";
      ".config/hypr/bind.conf".source = "${configDir}/hypr/bind.conf";
      ".config/hypr/exec.conf".source = "${configDir}/hypr/exec.conf";
      ".config/hypr/hyprland.conf".source = "${configDir}/hypr/hyprland.conf";
      ".config/hypr/input.conf".source = "${configDir}/hypr/input.conf";
      ".config/hypr/monitor.conf".source = "${configDir}/hypr/monitor.conf";
      ".config/hypr/window.conf".source = "${configDir}/hypr/window.conf";
      ".config/hypr/windowrule.conf".source = "${configDir}/hypr/windowrule.conf";
      ".config/swayidle".source = "${configDir}/swayidle";
      ".config/swaylock".source = "${configDir}/swaylock";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/waybar".source = "${configDir}/waybar";
      ".config/eww".source = "${configDir}/eww";
      ".config/btop".source = "${configDir}/btop";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/mako".source = "${configDir}/mako";
      ".config/hypr/hyprpaper.conf".source = "${configDir}/hypr/hyprpaper.conf";
  };
}
