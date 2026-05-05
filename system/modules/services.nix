{ config, pkgs, ... }:

let
  sddmTheme = import ./sddm-theme.nix { inherit pkgs; };
in
{
  services = {
    dbus.enable = true;
    picom.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;

    xserver = {
      enable = true;
      layout = "fr";
      xkbOptions = "grp:alt_shift_toggle, caps:swapescape";

      displayManager.sddm = {
        enable = true;
        theme = "astronaut";
      };
    };
  };

  environment.systemPackages = [
    sddmTheme
  ];

  environment.etc."sddm.conf.d/theme.conf".text = ''
    [Theme]
    Current=astronaut
  '';
}