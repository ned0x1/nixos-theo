{ config, pkgs, lib, ... }:

let
  ASSETS = ../assets;
in {
  home = {
    username = "theo";
    homeDirectory = "/home/theo";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  home.file = {
    "Pictures/Wallpapers/nixos-wallpaper.png" = {
      source = ASSETS + "/wallpaper.png";
    };

    ".config/waybar" = {
      source = ASSETS + "/waybar";
      recursive = true;
    };

    ".config/kitty/kitty.conf" = {
      source = ASSETS + "/kitty/kitty.conf";
    };

    ".config/walker" = {
      source = ASSETS + "/walker";
      recursive = true;
    };

    ".config/waybar/waybar.sh" = {
      source = ASSETS + "/waybar/waybar.sh";
      executable = true;
    };

    ".config/waybar/modules/mediaplayer.py" = {
      source = ASSETS + "/waybar/modules/mediaplayer.py";
      executable = true;
    };
  };

  programs = {
    waybar.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default.extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
      ];
    };

    chromium = {
      enable = true;
      package = pkgs.chromium;
    };
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "~/Pictures/Wallpapers/nixos-wallpaper.png"
      ];

      wallpaper = [
        ", ~/Pictures/Wallpapers/nixos-wallpaper.png"
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    extraConfig = ''
      gesture = 3, horizontal, workspace
    '';

    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";
      "$mainMod" = "SUPER";
      "$code" = "codium";
      "$browser" = "chromium --incognito";
      "$editor" = "gnome-text-editor";

      general = {
        layout = "dwindle";
        gaps_in = 1;
        gaps_out = 1;
        border_size = 1;
        resize_on_border = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      env = [
        "NIXOS_OZONE_WL,1"
        "GTK_THEME,Dark-Gruvbox"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_CURRENT_DESKTOP,Hyprland"

        "XDG_DESKTOP_DIR,$HOME/Desktop"
        "XDG_DOWNLOAD_DIR,$HOME/Downloads"
        "XDG_TEMPLATES_DIR,$HOME/Templates"
        "XDG_PUBLICSHARE_DIR,$HOME/Public"
        "XDG_DOCUMENTS_DIR,$HOME/Documents"
        "XDG_MUSIC_DIR,$HOME/Music"
        "XDG_PICTURES_DIR,$HOME/Pictures"
        "XDG_VIDEOS_DIR,$HOME/Videos"

        "HYPRSHOT_DIR,$HOME/Pictures/Screenshots"
      ];

      exec-once = [
        "sh ~/.config/waybar/waybar.sh"
        "hyprpaper"
        "wl-clip-persist"
        "power-profiles-daemon"
        "nm-applet --no-agent"
      ];

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        numlock_by_default = true;
        touchpad.natural_scroll = true;
      };

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, F, exec, $fileManager"
        "$mainMod, E, exec, $menu"
        "$mainMod, C, exec, $code"
        "$mainMod, G, exec, $browser"

        "$mainMod, Q, killactive,"
        "$mainMod, L, exec, hyprlock"
        "$mainMod CTRL, L, exit"

        "$mainMod, W, togglefloating"
        "$mainMod, Return, fullscreen"

        "$mainMod CTRL, right, workspace, +1"
        "$mainMod CTRL, left, workspace, -1"
        "$mainMod ALT, right, movetoworkspace, +1"
        "$mainMod ALT, left, movetoworkspace, -1"

        "$mainMod, P, exec, hyprshot -m region --clipboard"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}