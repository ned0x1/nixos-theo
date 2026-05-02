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

  # ----------------------------
  # FILES / DOTFILES
  # ----------------------------
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

  # ----------------------------
  # PROGRAMS
  # ----------------------------
  programs = {
    waybar.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default.extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
      ];
    };

    chromium.enable = true;
  };

  # ----------------------------
  # HYPRPAPER
  # ----------------------------
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

  # ----------------------------
  # HYPRLAND
  # ----------------------------
  wayland.windowManager.hyprland = {
    enable = true;

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

      env = [
        "NIXOS_OZONE_WL,1"
        "GTK_THEME,Dark-Gruvbox"
        "XDG_SESSION_DESKTOP,Hyprland"
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
      };

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, F, exec, $fileManager"
        "$mainMod, E, exec, $menu"
        "$mainMod, Q, killactive,"
      ];
    };
  };
}