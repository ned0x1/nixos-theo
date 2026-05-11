{ config, pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-f57813ed-981c-4a24-9766-3d78f675b917".device =
  "/dev/disk/by-uuid/f57813ed-981c-4a24-9766-3d78f675b917";

  boot.plymouth = {
    enable = true;
    theme = "spinner";
  };

  boot.kernelParams = [ "quiet" "loglevel=3" ];

  console.keyMap = lib.mkForce "${pkgs.kbd}/share/keymaps/i386/azerty/fr.map.gz";

}
