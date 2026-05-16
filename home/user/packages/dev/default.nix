{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    nixd
    nixfmt
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
