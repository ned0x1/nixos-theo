{ config, pkgs, ... }:

let
  myAliases = {
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
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = myAliases;

    initContent = ''
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$PATH:/home/theo/.dotnet/tools"

      export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

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