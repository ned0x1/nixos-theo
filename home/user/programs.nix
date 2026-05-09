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
      bbenoist.nix

      github.copilot
      github.copilot-chat
    ];
  };

  programs.home-manager.enable = true;
}