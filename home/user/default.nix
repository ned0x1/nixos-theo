{
    imports = [
        ./git.nix
        ./gtk.nix
        ./shell.nix
        ./config.nix
        ./packages.nix
        ./programs.nix
        ./services.nix
        ./environment.nix
        ./waybar.nix
        ./hyprland.nix
        ./fonts.nix
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
