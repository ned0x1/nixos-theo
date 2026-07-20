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
        "electron-40.10.5"
      ];
    };
  };
}
