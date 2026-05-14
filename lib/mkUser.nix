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
  pkgs = import nixpkgs {
    inherit system;
  };
  extraSpecialArgs = {
    inherit username homeManagerStateVersion firefox-addons nixcord stylix home-manager;
  };
  modules = [
    nixcord.homeModules.nixcord
    stylix.homeModules.stylix
    ../home
  ];
}