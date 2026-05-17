{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      mouse_hide_wait = 2.0;
      cursor_shape = "block";
      url_color = "#0087bd";
      url_style = "dotted";
      confirm_os_window_close = 0;
      background_opacity = lib.mkForce "0.9";
      background_blur = 160;
    };
    keybindings = {
      "ctrl+u" = "launch --title exegol-history --type window exegol-history set creds";
    };
  };
}
