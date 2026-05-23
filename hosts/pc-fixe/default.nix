{ ... }:
{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "pc-fixe";

  boot.initrd.luks.devices."luks-f57813ed-981c-4a24-9766-3d78f675b917".device =
    "/dev/disk/by-uuid/f57813ed-981c-4a24-9766-3d78f675b917";
}
