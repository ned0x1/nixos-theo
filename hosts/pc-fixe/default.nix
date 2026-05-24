{
  config,
  pkgs,
  lib,
  ...
}:
let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    output DP-2 mode 3440x1440@144Hz position 0,0
    output HDMI-A-1 power off

    exec "${lib.getExe pkgs.regreet}; swaymsg exit"
  '';
in
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "pc-fixe";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.initrd.luks.devices."luks-ff58eca6-1be3-49dc-b52d-f7fd6e33a9f9".device =
    "/dev/disk/by-uuid/ff58eca6-1be3-49dc-b52d-f7fd6e33a9f9";

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  fileSystems."/boot" = {
    device = "/dev/nvme0n1p6";
    fsType = "ext4";
  };
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/6472-2680";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
      user = "greeter";
    };
  };
}
