{ config, firefox-addons, stylix, nixcord, pkgs, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
  mono = config.stylix.fonts.monospace.name;
in
{
  programs = {
    zsh = {
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
    
    firefox = {
      enable = true;
      profiles.theo = {
        extensions.packages = with firefox-addons.packages."x86_64-linux"; [
          bypass-paywalls-clean
          darkreader
          facebook-container
          i-dont-care-about-cookies
          proton-pass
          to-google-translate
          view-image
          ublock-origin
          youtube-shorts-block
        ];
      };
    };

    vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        github.copilot
        github.copilot-chat
      ];
      profiles.default.userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      };
    };

    tmux = {
      enable = true;
      escapeTime = 0;
      
      plugins = with pkgs; [
          tmuxPlugins.resurrect
          tmuxPlugins.continuum
          tmuxPlugins.catppuccin
      ];

      extraConfig = ''
          set -g default-terminal "xterm-256color"
          set -ga terminal-overrides ",*256col*:Tc"
          set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
          set-environment -g COLORTERM "truecolor"
          set -g prefix C-a
          unbind C-b
          bind-key C-a send-prefix

          unbind %
          bind | split-window -h

          unbind '"'
          bind - split-window -v

          unbind r
          bind r source-file ~/.tmux.conf

          bind -r j resize-pane -D 5
          bind -r k resize-pane -U 5
          bind -r l resize-pane -R 5
          bind -r h resize-pane -L 5

          bind -r m resize-pane -Z

          set -g mouse on

          set-window-option -g mode-keys vi

          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection

          unbind -T copy-mode-vi MouseDragEnd1Pane

          set -g @resurrect-capture-pane-contents 'on'
          set -g @continuum-restore 'on'
          set -g @catppuccin-flavour 'macchiato'
      '';
    };

    nixcord = {
      enable = true;
      vesktop.enable = true;
      discord.enable = false;

      quickCss = ''
        body {
          --font: "${mono}";
          --code-font: "${mono}";

          --small-user-panel: on;      /* on/off */
          --unrounding: on;            /* on/off */
          --custom-spotify-bar: on;    /* on/off */
          --ascii-titles: on;          /* on/off */
          --ascii-loader: system24;    /* off | system24 | cats */
          --panel-labels: on;          /* on/off */
          --label-font-weight: 500;
      }

      :root {
        --colors: on;

        /* backgrounds */
        --bg-4: ${c.base00}; /* main background */
        --bg-3: ${c.base01}; /* secondary background */
        --bg-2: ${c.base02}; /* buttons */
        --bg-1: ${c.base03}; /* clicked buttons */

        /* text */
        --text-5: ${c.base03}; /* muted */
        --text-4: ${c.base04}; /* channels/icons */
        --text-3: ${c.base05}; /* normal */
        --text-2: ${c.base06}; /* headings/important */
        --text-1: ${c.base07}; /* bright */
        --text-0: var(--bg-4); /* text on colored elements */

        /* states */
        --hover:    color-mix(in srgb, var(--text-3), transparent 90%);
        --active:   color-mix(in srgb, var(--text-3), transparent 82%);
        --active-2: color-mix(in srgb, var(--text-3), transparent 74%);
        --message-hover: color-mix(in srgb, var(--bg-4), white 4%);

        /* accent family (derive from base0D) */
        --lavender-1: ${c.base0D};
        --lavender-2: color-mix(in srgb, ${c.base0D}, white 12%);
        --lavender-3: color-mix(in srgb, ${c.base0D}, black 6%);
        --lavender-4: color-mix(in srgb, ${c.base0D}, white 20%);
        --lavender-5: color-mix(in srgb, ${c.base0D}, black 14%);

        --accent-1: var(--lavender-1);
        --accent-2: var(--lavender-2);
        --accent-3: var(--lavender-3);
        --accent-4: var(--lavender-4);
        --accent-5: var(--lavender-5);

        /* “danger” accent (mute/deafen etc.) */
        --accent-new: ${c.base08};

        /* mention / reply overlays */
        --mention:       linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent);
        --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent);
        --reply:         linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
        --reply-hover:   linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);

        /* status indicators */
        --online:    ${c.base0B};
        --dnd:       ${c.base08};
        --idle:      ${c.base0A};
        --streaming: ${c.base0E};
        --offline:   var(--text-4);

        /* borders */
        --border-light: var(--hover);
        --border:       var(--active);
        --border-hover: var(--accent-2);
        --button-border: color-mix(in srgb, var(--text-1), transparent 90%);

        --red-2:    ${c.base08};
        --green-2:  ${c.base0B};
        --yellow-2: ${c.base0A};
        --blue-2:   ${c.base0C};
        --purple-2: ${c.base0E};
      }
    '';
    };

  };
}