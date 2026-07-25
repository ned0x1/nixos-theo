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
      "10.129.60.103" = [
        "bedside.htb"
      ];
    };
  };
}
