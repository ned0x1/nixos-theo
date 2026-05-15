{
  config,
  pkgs,
  username,
  ...
}:

{
  networking = {
    hostName = username;
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = true;
  };
}
