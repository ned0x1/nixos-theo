/*{ config, pkgs, ... }:

let
  myAliases = {
    zsh = "${pkgs.zsh}/bin/zsh";
    cat = "bat";
    ls = "eza --icons=always";

    full-rebuild = ''
      cd /home/theo/Documents/nixos-theo && sudo nixos-rebuild switch --flake .#pc-portable
    '';

    home-rebuild = "cd /home/theo/Documents/nixos-theo && home-manager switch --flake .#theo --impure";
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
}*/