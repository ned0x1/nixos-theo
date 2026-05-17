{
  nixpkgs,
  home-manager,
  firefox-addons,
  nixcord,
  stylix,
  burpsuite-nix,
}:
{
  hostname,
  system,
  username,
  homeManagerStateVersion,

}:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit username;
  };

  modules = [
    ../system/configuration.nix

    home-manager.nixosModules.home-manager

    (
      { ... }:
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;

        home-manager.backupFileExtension = "bak";

        home-manager.extraSpecialArgs = {
          inherit
            username
            homeManagerStateVersion
            firefox-addons
            nixcord
            stylix
            home-manager
            ;
        };

        home-manager.users.${username} = {
          imports = [
            nixcord.homeModules.nixcord
            stylix.homeModules.stylix
            burpsuite-nix.homeManagerModules.default
            ../home
          ];
        };
      }
    )
  ];
}
