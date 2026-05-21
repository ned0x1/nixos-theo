{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    nixd
    nixfmt
    go
    python3Packages.pipx
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
