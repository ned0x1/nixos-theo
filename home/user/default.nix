{
  imports = [
    ./packages.nix
    ./programmes
    ./environment.nix
    ./hyprland
    ./stylix.nix
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
}
