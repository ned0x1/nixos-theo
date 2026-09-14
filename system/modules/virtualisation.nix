{ pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
