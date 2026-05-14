{ config, pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
      {
        timeout = 420;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      indicator = true;
      clock = true;
      screenshots = true;

      # Effects and display
      "effect-blur" = "11x11";
      "indicator-radius" = 80;
      "indicator-thickness" = 8;
      timestr = "%I:%M %p";
      datestr = "%F";
    };
  };
}
