{ ... }:
{
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
