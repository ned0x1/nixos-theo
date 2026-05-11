{ pkgs, ... }:

{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    audio.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };

  services.udev.packages = [ pkgs.alsa-ucm-conf ];

}
