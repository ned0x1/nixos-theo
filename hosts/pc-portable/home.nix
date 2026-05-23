{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@144.00000,0x0,1.25"
    ];
  };

  programs.btop.package = pkgs.btop.override { cudaSupport = true; };
}
