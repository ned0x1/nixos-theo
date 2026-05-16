{
  imports = [
    ./packages.nix
    ./programmes
    ./environment.nix
    ./hyprland.nix
    ./stylix.nix
    ./bat
    ./firefox
    ./vscode
    ./tmux
    ./nixcord
    ./git
    ./kitty
    ./btop
    ./waybar
    ./mako
    ./yazi
    ./hyprlock
    ./zsh
    ./wlogout
    ./rofi
    ./keepassXC
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
