{
  pkgs,
  config,
  username,
  ...
}:

{
  home.packages = with pkgs; [
    eza
    fzf
    nitch
    zoxide
  ];
  programs.zsh = {
    enable = true;

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    syntaxHighlighting.enable = true;

    completionInit = ''
      autoload -U compinit && compinit
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';

    shellAliases = {
      zsh = "${pkgs.zsh}/bin/zsh";
      cat = "bat --style=plain --pager=never";
      ls = "eza --icons=always";
      l = "${pkgs.eza}/bin/eza -lah --git --icons=always";
      ll = "${pkgs.eza}/bin/eza -lah --git --icons=always";
      tree = "${pkgs.eza}/bin/eza -T --icons";
      update-nix = "cd ${config.home.homeDirectory}/Documents/nixos-theo && nix flake update";
      clear-nix = "nix store gc";
      c = "clear";
      nano = "micro";
      bloodhound-up = "cd ${config.home.homeDirectory}/.tools/bloodhound-cli ; ./bloodhound-cli up";
      bloodhound-down = "cd ${config.home.homeDirectory}/.tools/bloodhound-cli ; ./bloodhound-cli down";
      bloodhound-password = "cd ${config.home.homeDirectory}/.tools/bloodhound-cli ; ./bloodhound-cli config get default_password";

    };

    initContent = ''

      # --- Rebuild config nix ---
      full-rebuild() {
        if [[ -z "''${1}" ]]; then
          echo "Usage: full-rebuild <hostname>"
          return 1
        fi
        cd ${config.home.homeDirectory}/Documents/nixos-theo && sudo nixos-rebuild switch --flake ".#''${1}"
      }

      home-rebuild() {
        if [[ -z "''${1}" ]]; then
          echo "Usage: home-rebuild <hostname>"
          return 1
        fi
        cd ${config.home.homeDirectory}/Documents/nixos-theo && home-manager switch --flake ".#${username}@''${1}" --impure
      }

      # --- Tmux auto-attach ---
      if [ -z "$TMUX" ]; then
        tmux new-session
      fi

      source "$HOME/.exegol_history/profile.sh" 2>/dev/null

      exh() {
        ${config.home.homeDirectory}/.local/bin/exegol-history "$@"
        if [[ "$1" == "set" ]]; then
          export _EXH_RELOAD=1
          exec zsh
        fi
      }

      # --- Thème Stylix ---
      _zsh_icon="${config.lib.stylix.colors.withHashtag.base0D}"
      _zsh_user="${config.lib.stylix.colors.withHashtag.base0B}"
      _zsh_path="${config.lib.stylix.colors.withHashtag.base0C}"

      # --- Prompt simple et épuré ---
      _git_branch() {
        local branch
        branch=$(${pkgs.git}/bin/git symbolic-ref --short HEAD 2>/dev/null)
        [[ -n "$branch" ]] && echo " %F{yellow}($branch)%f"
      }
      setopt PROMPT_SUBST
      export PS1=$'\n%F{$_zsh_path}%~%f$(_git_branch)\n%F{$_zsh_icon}❯%f '

      # --- zoxide pour cd rapide ---
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$PATH:${config.home.homeDirectory}/.dotnet/tools"

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
      if [[ ! -v _EXH_RELOAD ]]; then
        ${pkgs.nitch}/bin/nitch
      fi
    '';
  };
}
