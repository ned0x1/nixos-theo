{ config, pkgs, ... }:

{
users.users.theo = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ 
     	  "wheel" 
        "qemu"
        "kvm"
        "libvirtd"
        "networkmanager"
     ]; 
   };
}
