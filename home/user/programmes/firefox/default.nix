{
  config,
  firefox-addons,
  username,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      isDefault = true;
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

  stylix.targets.firefox.profileNames = [ username ];
}
