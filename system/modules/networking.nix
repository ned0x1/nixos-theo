{
  config,
  pkgs,
  username,
  ...
}:

{
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = true;
  };
}
