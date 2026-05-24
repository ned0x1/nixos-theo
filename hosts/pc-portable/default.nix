{ ... }:
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "pc-portable";

  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  boot.initrd.luks.devices."luks-f57813ed-981c-4a24-9766-3d78f675b917".device =
    "/dev/disk/by-uuid/f57813ed-981c-4a24-9766-3d78f675b917";

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 30;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  services.greetd.enable = true;
}
