{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        _args = [
          {
            output = "DP-2";
            mode = "3440x1440@144";
            position = "0x0";
            scale = 1;
          }
        ];
      }
      {
        _args = [
          {
            output = "HDMI-A-1";
            mode = "preferred";
            position = "-1080x0";
            scale = 1;
            transform = 3;
          }
        ];
      }
    ];

    workspace_rule = [
      {
        _args = [
          {
            workspace = "1";
            monitor = "HDMI-A-1";
            default = true;
          }
        ];
      }
      {
        _args = [
          {
            workspace = "2";
            monitor = "HDMI-A-1";
          }
        ];
      }
      {
        _args = [
          {
            workspace = "3";
            monitor = "DP-2";
            default = true;
          }
        ];
      }
    ];
  };

  programs.btop.package = pkgs.btop.override { rocmSupport = true; };
}
