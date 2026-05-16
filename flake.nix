{
  description = "Theo NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
          nixcord
          stylix
          ;
      };

      mkUser = import ./lib/mkUser.nix {
        inherit (inputs)
          nixpkgs
          home-manager
          firefox-addons
          nixcord
          stylix
          ;
      };

    in
    {
      nixosConfigurations = {
        "pc-portable" = mkHost {
          inherit system username homeManagerStateVersion;
          hostname = "pc-portable";
        };
      };

      homeConfigurations = {
        "${username}" = mkUser {
          inherit system username homeManagerStateVersion;
        };
      };

    };

}
