{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "plain";
      pager = "never";
    };
  };
}
