let configDir = ../config;
in
{
  home.file = {
      ".config/wallpapers" = {
        source = "${configDir}/wallpapers";
        recursive = true;
      };
      ".config/neofetch".source = "${configDir}/neofetch";
      ".config/hypr/bind.conf".source = "${configDir}/hypr/bind.conf";
      ".config/hypr/exec.conf".source = "${configDir}/hypr/exec.conf";
      ".config/hypr/input.conf".source = "${configDir}/hypr/input.conf";
      ".config/hypr/monitor.conf".source = "${configDir}/hypr/monitor.conf";
      ".config/hypr/window.conf".source = "${configDir}/hypr/window.conf";
      ".config/hypr/windowrule.conf".source = "${configDir}/hypr/windowrule.conf";
      ".config/swayidle".source = "${configDir}/swayidle";
      ".config/swaylock".source = "${configDir}/swaylock";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/mako".source = "${configDir}/mako";
      ".config/yazi".source = "${configDir}/yazi";
  };
}
