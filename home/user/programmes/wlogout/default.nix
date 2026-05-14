{ pkgs, ... }:
{
  home.packages = with pkgs; [ wleave ];

  programs.wlogout = {
    enable = true;
    layout = [
      { label = "lock";     action = "hyprlock";              text = "Lock";     keybind = "l"; }
      { label = "logout";   action = "hyprctl dispatch exit"; text = "Logout";   keybind = "e"; }
      { label = "shutdown"; action = "systemctl poweroff";    text = "Shutdown"; keybind = "s"; }
      { label = "reboot";   action = "systemctl reboot";      text = "Reboot";   keybind = "r"; }
    ];

    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(26, 27, 38, 0.85);
      }

      button {
        border-radius: 16px;
        border-color: #3b4261;
        text-decoration-color: #c0caf5;
        color: #c0caf5;
        background-color: #1f2335;
        border-style: solid;
        border-width: 1px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        margin: 10px;
      }

      button:focus, button:active, button:hover {
        outline-style: none;
        background-color: #292e42;
        border-color: #7aa2f7;
      }

      #lock {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/lock.svg"));
      }
      #logout {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/logout.svg"));
      }
      #shutdown {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/shutdown.svg"));
      }
      #reboot {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/reboot.svg"));
      }
    '';
  };
}