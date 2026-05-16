{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    nixd
    (python3.withPackages (
      ps: with ps; [
        requests
      ]
    ))

  ];

  imports = [
    ./git
  ];
}
