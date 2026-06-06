{
  username,
  firefox-addons,
  firefox-nightly,
  config,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    package = firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
    profiles.${username} = {
      isDefault = false;
      extensions.packages = with firefox-addons.packages."x86_64-linux"; [
        multi-account-containers
      ];
    };
  };
  stylix.targets.firefox.profileNames = [ username ];
}
