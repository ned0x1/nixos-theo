{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  console.keyMap = "fr";

  services.printing.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.libinput.enable = true;
  services.seatd.enable = true;

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];

  services.xserver.xkb.layout = "fr";

  users.users.theo = {
    isNormalUser = true;
    description = "Theo";
    extraGroups = [ "networkmanager" "wheel" "input" "video" "seat" ];
  };

  programs.firefox.enable = true;

  nixpkgs = {
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    git
    dunst
    wl-clipboard
    grim
    slurp
    swappy
    blueman
    python3
    wget
    discord
  ];

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "fr";
    PATH = "$HOME/.local/share/bin:$PATH";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.channel.enable = false;

  system.stateVersion = "25.11";
}