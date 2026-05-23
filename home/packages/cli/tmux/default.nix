{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -g mouse on
      set-option -g set-clipboard on
      bind h split-window -h
      bind v split-window -v
    '';
  };
}
