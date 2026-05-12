{
  home-manager,
  nixpkgs,
  firefox-addons,
  nixcord,
  stylix,
}: {
  system,
  username,
  homeManagerStateVersion,
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit username homeManagerStateVersion firefox-addons nixcord stylix home-manager;
  };
  modules = [
    stylix.homeManagerModules.stylix
    ../home
  ];
}