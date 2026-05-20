{
  home-manager,
  nixpkgs,
  firefox-addons,
  nixcord,
  stylix,
  burpsuite-nix,
}:
{
  system,
  username,
  homeManagerStateVersion,
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs { inherit system; };
  extraSpecialArgs = {
    inherit
      username
      homeManagerStateVersion
      firefox-addons
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
  ];
}
