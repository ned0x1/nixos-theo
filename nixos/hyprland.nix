{ pkgs, ... }:

{
  # ----------------------------
  # DISPLAY / WAYLAND
  # ----------------------------
  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # ----------------------------
  # SYSTEM PACKAGES (DESKTOP ONLY)
  # ----------------------------
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

  # ----------------------------
  # POLKIT / GNOME SERVICES
  # ----------------------------
  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;

  services.gvfs.enable = true;

  # ----------------------------
  # FONTS
  # ----------------------------
  fonts.packages = with pkgs; [
    font-awesome
  ];

  # ----------------------------
  # POWER
  # ----------------------------
  services.power-profiles-daemon.enable = true;
}