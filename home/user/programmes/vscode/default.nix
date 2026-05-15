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
    };
  };

}
