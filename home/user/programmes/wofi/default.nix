{ ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 600;
      location = "center";
      orientation = "vertical";
      allow_markup = false;
      show = "drun";
    };
  };
}
