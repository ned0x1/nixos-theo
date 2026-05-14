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
    };
  };

}
