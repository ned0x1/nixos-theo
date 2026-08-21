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
      "10.129.62.196" = [
        "flow.fireflow.htb"
      ];
    };
  };
}
