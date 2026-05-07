{ pkgs, ... }:

{
  home.packages = with pkgs; [

   

    # Audio (wireplumber module)
    pamixer

    # Network module
    # Bluetooth module
    blueman

    # Backlight module
    brightnessctl

    # ScrollMPRIS / media script
    playerctl
    jq

  ];
}