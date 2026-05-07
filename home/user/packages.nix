{ pkgs, ... }:

{
  

  home.packages = [

    # Dev stuff
    pkgs.gcc
    pkgs.go
    pkgs.nodePackages.pnpm
    (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))
    pkgs.rustup
    
    # Work stuff
    pkgs.obsidian
    pkgs.thunderbird
    pkgs.libreoffice-qt
    pkgs.vscode

    # ZSH theme
    pkgs.zsh-powerlevel10k

    # Social
    pkgs.discord
 
    # Bluetooth
    pkgs.blueberry

    # Utils
    pkgs.viewnior
    pkgs.hyprshot
    pkgs.catppuccin-cursors.macchiatoBlue
    pkgs.catppuccin-gtk
    pkgs.papirus-folders
  ];
}
