{
  nixpkgs,
  home-manager,

}: {
  hostname,
  system,
  username,

}: nixpkgs.lib.nixosSystem {
    inherit system;
    
    specialArgs = {
        inherit username;
    };

    modules = [
        ../system/configuration.nix 
        #../home

        #home-manager.nixosModules.home-manager
    ];
}
