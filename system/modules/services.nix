{ config, pkgs, lib, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = false;
    power-profiles-daemon.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember";
          user = "greeter";
        };
      };
    };

  };

}