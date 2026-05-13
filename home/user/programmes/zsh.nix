{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$PATH:/home/theo/.dotnet/tools"

      export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };
}
