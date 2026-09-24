{
  config,
  pkgs,
  username,
  ...
}:

{
  networking = {
    networkmanager.enable = true;
    enableIPv6 = true;
    firewall.enable = false;
  };

  environment.etc."hosts".enable = false;
}
