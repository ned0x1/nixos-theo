{ config, pkgs, ... }:

{
users.users.theo = {
     isNormalUser = true;
     shell = pkgs.bash;
     extraGroups = [ 
     	  "wheel" 
        "networkmanager"
     ]; 
   };
}
