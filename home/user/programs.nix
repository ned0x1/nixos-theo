{ firefox-addons, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.theo = {
      extensions.packages = with firefox-addons.packages."x86_64-linux"; [
        bypass-paywalls-clean
        darkreader
        facebook-container
        i-dont-care-about-cookies
        proton-pass
        to-google-translate
        view-image
        ublock-origin
        youtube-shorts-block
      ];
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      github.copilot-chat
    ];
    profiles.default.userSettings = {
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "editor.fontLigatures" = true;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
    };
  };


  programs.home-manager.enable = true;
}