{
  home-manager,
  nixpkgs,
  firefox-addons,
  firefox-nightly,
  nixcord,
  stylix,
  burpsuite-nix,
}:
{
  system,
  username,
  homeManagerStateVersion,
  hostHomeModules ? [ ],
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs { inherit system; };
  extraSpecialArgs = {
    inherit
      username
      homeManagerStateVersion
      firefox-addons
      firefox-nightly
      nixcord
      stylix
      home-manager
      ;
  };
  modules = [
    nixcord.homeModules.nixcord
    stylix.homeModules.stylix
    burpsuite-nix.homeManagerModules.default
    ../home
  ]
  ++ hostHomeModules;
}
