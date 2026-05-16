{
  imports = [
    ./packages.nix
    ./packages
    #./environment.nix
    ./hyprland
    ./stylix.nix
    ./xdg.nix
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
