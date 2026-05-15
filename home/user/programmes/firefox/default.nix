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
        i-dont-care-about-cookies
        view-image
        ublock-origin
        youtube-shorts-block
        keepassxc-browser
      ];
    };
  };

  stylix.targets.firefox.profileNames = [ username ];
}
