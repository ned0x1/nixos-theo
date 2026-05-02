{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ----------------------------
  # BOOT
  # ----------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-f57813ed-981c-4a24-9766-3d78f675b917".device =
  "/dev/disk/by-uuid/f57813ed-981c-4a24-9766-3d78f675b917";

  # ----------------------------
  # NETWORK
  # ----------------------------
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # ----------------------------
  # TIME / LOCALE
  # ----------------------------
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

  # ----------------------------
  # PRINTING
  # ----------------------------
  services.printing.enable = true;

  # ----------------------------
  # AUDIO (PIPEWIRE)
  # ----------------------------
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ----------------------------
  # BLUETOOTH
  # ----------------------------
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ----------------------------
  # INPUT / SEAT
  # ----------------------------
  services.libinput.enable = true;
  services.seatd.enable = true;

  # ----------------------------
  # XDG PORTAL (IMPORTANT HYPRLAND)
  # ----------------------------
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];

  services.xserver.xkb.layout = "fr";

  # ----------------------------
  # USER
  # ----------------------------
  users.users.theo = {
    isNormalUser = true;
    description = "Theo";
    extraGroups = [ "networkmanager" "wheel" "input" "video" "seat" ];
  };

  # ----------------------------
  # FIREFOX
  # ----------------------------
  programs.firefox.enable = true;

  # ----------------------------
  # UNFREE
  # ----------------------------
  nixpkgs.config.allowUnfree = true;

  # ----------------------------
  # SYSTEM PACKAGES (BASE ONLY)
  # ----------------------------
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

  # ----------------------------
  # SESSION VARS
  # ----------------------------
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "fr";
    PATH = "$HOME/.local/share/bin:$PATH";
  };

  # ----------------------------
  # FLAKES
  # ----------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.channel.enable = false;

  system.stateVersion = "25.11";
}