{ inputs, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.theo = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
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

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
  };

  programs.home-manager.enable = true;
}