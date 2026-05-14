{ config, pkgs, lib, ... }:

let
  colors = config.lib.stylix.colors;
  fonts = config.stylix.fonts;
in
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;

    settings = {
      general = {
        no_fade_in = false;
        no_fade_out = false;
        ignore_empty_input = false;
        pam_module = "login";
        grace = 0;
        disable_loading_bar = false;
      };

      input-field = lib.mkForce [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgba(${colors.base0C}cc)";
          inner_color = "rgba(${colors.base00}cc)";
          font_color = "rgba(${colors.base07}cc)";
          fade_on_empty = true;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = 10;
          check_color = "rgba(${colors.base0B}cc)";
          fail_color = "rgba(${colors.base08}cc)";
          fail_text = "<i>$ATTEMPTS</i>";
          capslock_color = "rgba(${colors.base07}cc)";
          position = "0, -30";
          halign = "center";
          valign = "center";
        }
      ];

      label = lib.mkForce [
        {
          monitor = "";
          text = "$TIME";
          text_align = "center";
          color = "rgba(${colors.base07}cc)";
          font_size = 64;
          font_family = "${fonts.monospace.name}";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000]echo \"$LAYOUT\"";
          text_align = "center";
          color = "rgba(${colors.base07}99)";
          font_size = 16;
          font_family = "${fonts.monospace.name}";
          position = "0, -50";
          halign = "center";
          valign = "top";
        }
      ];
    };
  };
}
