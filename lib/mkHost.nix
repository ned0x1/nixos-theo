{
  nixpkgs,
  home-manager,
  firefox-addons,

}: {
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

    ({ ... }: {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        
        home-manager.extraSpecialArgs = {
            inherit username homeManagerStateVersion firefox-addons home-manager;
        };

        home-manager.users.${username} = {
            imports = [
                ../home
            ];
        };
    })
  ];
}