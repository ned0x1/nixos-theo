{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.lib.formats.rasi) mkLiteral;
  roundedTheme = {
    "*" = {
      font = "Roboto 12";
      margin = mkLiteral "0px";
      padding = mkLiteral "0px";
      spacing = mkLiteral "0px";
    };
    window = {
      location = mkLiteral "north";
      "y-offset" = mkLiteral "calc(50% - 176px)";
      width = 480;
      "border-radius" = mkLiteral "24px";
    };
    mainbox = {
      padding = mkLiteral "12px";
    };
    inputbar = {
      border = mkLiteral "2px";
      "border-radius" = mkLiteral "16px";
      padding = mkLiteral "8px 16px";
      spacing = mkLiteral "8px";
      children = map mkLiteral [ "entry" ];
    };
    prompt = {
      enabled = false;
    };
    entry = {
      placeholder = "Search";
    };
    message = {
      margin = mkLiteral "12px 0 0";
      "border-radius" = mkLiteral "16px";
    };
    textbox = {
      padding = mkLiteral "8px 24px";
    };
    listview = {
      margin = mkLiteral "12px 0 0";
      lines = 8;
      columns = 1;
      "fixed-height" = false;
    };
    element = {
      padding = mkLiteral "8px 16px";
      spacing = mkLiteral "8px";
      "border-radius" = mkLiteral "16px";
    };
    "element-icon" = {
      size = mkLiteral "1em";
      "vertical-align" = mkLiteral "0.5";
    };
    "element-text" = {
      "text-color" = mkLiteral "inherit";
    };
  };
in
{
  programs.rofi = {
    enable = true;
    extraConfig = {
      show-icons = true;
    };
    theme = roundedTheme;
  };

  xdg.dataFile = {
    "applications/rofi.desktop".text = ''
      [Desktop Entry]
      Name=Rofi
      Type=Application
      NoDisplay=true
    '';
    "applications/rofi-theme-selector.desktop".text = ''
      [Desktop Entry]
      Name=Rofi Theme Selector
      Type=Application
      NoDisplay=true
    '';
    "applications/vesktop.desktop".text = ''
      [Desktop Entry]
      Name=Discord
      Type=Application
      Exec=vesktop
      Icon=${pkgs.discord}/share/icons/hicolor/256x256/apps/discord.png
      Categories=Network;InstantMessaging;
    '';
  };
}
