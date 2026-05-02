{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nautilus
    kitty
    walker
    hyprpaper
    seahorse
    nwg-look
    hyprshot
    wl-clip-persist
    brightnessctl
    wofi
    playerctl
    networkmanagerapplet
    pavucontrol
    hyprlock
    libinput
    gnome-calculator
    gnome-text-editor
  ];

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;

  services.gvfs.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  services.power-profiles-daemon.enable = true;
}