{
  config,
  username,
  homeManagerStateVersion,
  pkgs,
  lib,
  home-manager,
  ...
}:
{
  imports = [
    ./packages
    ./hyprland
    ./stylix.nix
    ./xdg.nix
  ];
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = homeManagerStateVersion;

  programs.home-manager.enable = true;

  home.file.".openvpn/.keep" = {
    text = "";
  };

  home.packages = [
    home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  overlays = [
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (pyfinal: pyprev: {
          pyiceberg = pyprev.pyiceberg.overridePythonAttrs (old: {
            pythonRelaxDeps = [ "rich" ];
          });
        })
      ];
    })
  ];
}
