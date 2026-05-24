{ config, pkgs, ... }:
{
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    cageArgs = [ "-s" ];
    settings = {
      background = {
        path = ../lib/wallpapers/lowpoly_street.png;
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Adwaita";
        font_name = "JetBrainsMono Nerd Font 12";
        icon_theme_name = "Adwaita";
        theme_name = "Adwaita";
      };
    };
    extraCss = ''
      * {
        color: #A9B1D6;
        background-color: transparent;
        font-family: "JetBrainsMono Nerd Font";
      }
      box, entry, button, combobox {
        background-color: rgba(26, 27, 38, 0.85);
        border-color: #2F3549;
        border-radius: 8px;
      }
      entry { color: #A9B1D6; }
      button { color: #A9B1D6; }
      button:hover { background-color: #2F3549; }
      #login_button {
        background-color: #2AC3DE;
        color: #1A1B26;
      }
      #login_button:hover { background-color: #0DB9D7; }
    '';
  };
  environment.variables.GSK_RENDERER = "ngl";
  environment.variables.XKB_DEFAULT_LAYOUT = "fr";
}
