{
  description = "Theo NixOS config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    burpsuite-nix = {
      url = "github:Red-Flake/burpsuite-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      username = "theo";
      homeManagerStateVersion = "26.05";
      mkHost = import ./lib/mkHost.nix {
        inherit (inputs)
          nixpkgs
          home-manager
          firefox-addons
          firefox-nightly
          nixcord
          stylix
          burpsuite-nix
          ;
      };
      mkUser = import ./lib/mkUser.nix {
        inherit (inputs)
          nixpkgs
          home-manager
          firefox-addons
          firefox-nightly
          nixcord
          stylix
          burpsuite-nix
          ;
      };
    in
    {
      nixosConfigurations = {
        "pc-portable" = mkHost {
          inherit system username homeManagerStateVersion;
          hostname = "pc-portable";
          hostModules = ./hosts/pc-portable;
        };
        "pc-fixe" = mkHost {
          inherit system username homeManagerStateVersion;
          hostname = "pc-fixe";
          hostModules = ./hosts/pc-fixe;
        };
      };
      homeConfigurations = {
        "theo@pc-portable" = mkUser {
          inherit system username homeManagerStateVersion;
          hostHomeModules = [ ./hosts/pc-portable/home.nix ];
        };
        "theo@pc-fixe" = mkUser {
          inherit system username homeManagerStateVersion;
          hostHomeModules = [ ./hosts/pc-fixe/home.nix ];
        };
      };
    };
}
