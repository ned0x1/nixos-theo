{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestion = { 
      enable = true;
      strategy = [ "history" "completion" ];
    };
    
    syntaxHighlighting.enable = true;
    
    completionInit = ''
      autoload -U compinit && compinit
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';

    shellAliases = {
      zsh = "${pkgs.zsh}/bin/zsh";
      cat = "bat";
      ls = "eza --icons=always";
      l = "${pkgs.eza}/bin/eza -lah --git --icons=always";
      ll = "${pkgs.eza}/bin/eza -lah --git --icons=always";
      tree = "${pkgs.eza}/bin/eza -T --icons";
      full-rebuild = "cd /home/theo/Documents/nixos-theo && sudo nixos-rebuild switch --flake .#pc-portable";
      home-rebuild = "cd /home/theo/Documents/nixos-theo && home-manager switch --flake .#theo --impure";
      c = "clear";
    };

    initContent = ''
      # --- Thème Stylix ---
      _zsh_icon="${config.lib.stylix.colors.withHashtag.base0D}"
      _zsh_user="${config.lib.stylix.colors.withHashtag.base0B}"
      _zsh_path="${config.lib.stylix.colors.withHashtag.base0C}"

      # --- Prompt simple et épuré ---
      setopt PROMPT_SUBST
      export PS1="%F{$_zsh_path}%1~%f %F{$_zsh_icon}❯%f "

      # --- zoxide pour cd rapide ---
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$PATH:/home/theo/.dotnet/tools"

      # --- Historique ---
      HISTFILE=~/.zsh_history
      HISTSIZE=10000
      SAVEHIST=10000
      setopt SHARE_HISTORY
      setopt APPEND_HISTORY
      setopt INC_APPEND_HISTORY

      # --- Ctrl+R pour historique interactif avec fzf ---
      __fzf_history() {
        local output
        output=$(${pkgs.fzf}/bin/fzf --no-sort --reverse --query "''${LBUFFER}" < <(${pkgs.coreutils}/bin/tac ~/.zsh_history | sed 's/^[^;]*;//'))
        [[ -n "$output" ]] && LBUFFER="$output"
      }
      zle -N fzf-history
      bindkey '^R' fzf-history

      # --- Navigation et édition de mot avec Ctrl ---
      bindkey '^[[1;5D' backward-word     # Ctrl+Flèche gauche
      bindkey '^[[1;5C' forward-word      # Ctrl+Flèche droite
      bindkey '^w' kill-word              # Ctrl+W pour effacer un mot
      bindkey '^H' backward-kill-word     # Ctrl+Backspace pour effacer mot arrière

      # --- fzf pour Tab avec complétion visuelle ---
      export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
      source <(${pkgs.fzf}/bin/fzf --zsh)

      # --- Affichage niche au lancement ---
      ${pkgs.nitch}/bin/nitch
    '';
  };
}
