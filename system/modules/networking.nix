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
    hosts = {
      "10.129.248.117" = [ "paperwork.htb" ];
    };
  };
}
