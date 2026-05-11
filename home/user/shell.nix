{ config, pkgs, ... }:

let
  myAliases = {
    zsh = "${pkgs.zsh}/bin/zsh";
    cat = "bat";
    ls = "eza --icons=always";

    fullClean = ''
      nix-collect-garbage --delete-old
      sudo nix-collect-garbage -d
      sudo /run/current-system/bin/switch-to-configuration boot
    '';

    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#pc-portable";

    fullRebuild = ''
      sudo nixos-rebuild switch --flake ~/.dotfiles#pc-portable
      home-manager switch --flake ~/.dotfiles#pc-portable -b backup
    '';

    homeRebuild = "home-manager switch --flake ~/.dotfiles#pc-portable -b backup";
  };

in
{
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];

  home.shellAliases = myAliases;

  home.file.".p10k.zsh".text = ''
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      user
      dir
      vcs
      prompt_char
    )

    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status
      background_jobs
      time
    )

    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='❯'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='❯'

    typeset -g POWERLEVEL9K_USER_TEMPLATE='%n'
  '';
}