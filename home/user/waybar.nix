{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Audio (wireplumber module)
    pamixer

    # Bluetooth module
    blueman

    # Backlight module
    brightnessctl    

  ];
}