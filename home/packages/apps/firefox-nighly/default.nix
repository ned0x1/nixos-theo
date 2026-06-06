{
  username,
  firefox-addons,
  config,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-nightly-bin;
    profiles.${username} = {
      isDefault = true;
      extensions.packages = with firefox-addons.packages."x86_64-linux"; [
        pwnfox
        multi-account-containers
      ];
    };
  };
  stylix.targets.firefox.profileNames = [ username ];
}
