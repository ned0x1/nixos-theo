{
  home-manager,
  nixpkgs,
  firefox-addons,
}: {
  system,
  username,
  homeManagerStateVersion,
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit username homeManagerStateVersion firefox-addons;
  };
  modules = [
    ../home
  ];
}