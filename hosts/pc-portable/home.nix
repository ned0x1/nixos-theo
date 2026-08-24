{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        _args = [
          {
            output = "eDP-1";
            mode = "1920x1080@144.00000";
            position = "0x0";
            scale = 1.25;
          }
        ];
      }
    ];
  };

  programs.btop.package = pkgs.btop.override { cudaSupport = true; };
}
