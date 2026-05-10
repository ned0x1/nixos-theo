{ config, pkgs, ... }:

{
  networking = {
	hostName = "theo";
	networkmanager.enable = true;
	enableIPv6 = false;
	firewall.enable = true;
  };
}
