{ pkgs, config, ... }:
let
  # Scripts d'update
  run_system_update = pkgs.writeShellScript "run-system-update" ''
    #!/usr/bin/env bash
    set -euo pipefail
    cd ~/Documents/nixos-theo || exit 1
    ${pkgs.kitty}/bin/kitty --title "Mises à jour — Système" bash -lc "cd ~/Documents/nixos-theo && sudo nixos-rebuild switch --flake .#pc-portable --show-trace; echo; read -rp 'Appuyez sur Entrée pour fermer...' -r" &
  '';

  run_home_update = pkgs.writeShellScript "run-home-update" ''
    #!/usr/bin/env bash
    set -euo pipefail
    cd ~/Documents/nixos-theo || exit 1
    ${pkgs.kitty}/bin/kitty --title "Mises à jour — Home" bash -lc "cd ~/Documents/nixos-theo && home-manager switch --flake .#theo --impure; echo; read -rp 'Appuyez sur Entrée pour fermer...' -r" &
  '';
in
{
  programs.eww = {
    enable = true;
    configDir = config.xdg.configHome + "/eww";
  };

  # Générer le fichier updates.yuck avec les chemins corrects
  xdg.configFile."eww/updates.yuck".text = ''
    (defwindow updates
      :stacking "fg"
      :anchor "top right"
      :monitor 0
      :geometry (geometry :x "88%"
                          :y "0%"
                          :width "12%"
                          :height "15%")
      :background "#1f2430"
      (box :orientation "vertical" :spacing 4 :class "updates-box"
        (button :class "update-btn" :onclick "${run_system_update} &" "System")
        (button :class "update-btn" :onclick "${run_home_update} &" "Home")))

    (defwindow updates-overlay
      :stacking "bg"
      :anchor "top left"
      :monitor 0
      :geometry (geometry :x "0%"
                          :y "0%"
                          :width "100%"
                          :height "100%")
      (eventbox :onclick "eww close updates updates-overlay"
        (box :class "overlay-bg")))
  '';
}
