{ pkgs, config, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      github.copilot-chat
    ];
    profiles.default.userSettings = {
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "nix.formatterPath" = "nixfmt";
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "workbench.colorCustomizations" = {
        "editor.selectionBackground" = "#${config.lib.stylix.colors.base0D}80";
        "editor.wordHighlightBackground" = "#${config.lib.stylix.colors.base0B}40";
      };
    };
  };

}
