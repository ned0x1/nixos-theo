{ pkgs, ... }: 

{
  security.polkit.enable = true;
  security.pam.services.hyprlock = {};
}
