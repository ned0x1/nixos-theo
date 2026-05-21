{ pkgs, lib, ... }:
{
  programs.micro = {
    enable = true;
    settings = {
      autoindent = true;
      tabsize = 4;
      colorscheme = lib.mkForce "atom-dark";
      tabstospaces = false;
      mouse = true;
      ruler = true;
      syntax = true;
    };
  };

  home.file.".config/micro/bindings.json".text = builtins.toJSON {
    "Ctrl-k" = "DeleteLine";
    "Ctrl-x" = "Quit";
    "Ctrl-w" = "Find";
    "Alt-Right" = "WordRight";
    "Alt-Left" = "WordLeft";
  };
}
