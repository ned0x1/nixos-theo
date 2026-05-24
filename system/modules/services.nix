{
  config,
  pkgs,
  lib,
  ...
}:
{
  services = {
    dbus.enable = true;
    openssh.enable = false;
    power-profiles-daemon.enable = true;
  };
}
