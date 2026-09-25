# waybar.nix
{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;

        shellAliases = {
            ls = "ls --color=auto";
            grep = "grep --color=auto";
            wget = ''wget --hsts-file="$XDG_STATE_HOME/wget-hsts"'';
            nrs = "sudo nixos-rebuild switch --flake ~/.config/nixos#nixos";
            nrb = "sudo nixos-rebuild build --flake ~/.config/nixos#nixos";
            start-hypr = "exec uwsm start hyprland.desktop";
        };

        initContent = ''

            # Comportamiento de Tab: solo listar, no autocompletar la primera opción
            unsetopt MENU_COMPLETE
            zstyle ':completion:*' menu no

            # Colores para el autocompletado (Tab)
            zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

            # Path
            path+=("$HOME/.config/scripts/bin/")
            export PATH

            # Desactivar subrayados de syntax highlighting y autosuggestions
            typeset -A ZSH_HIGHLIGHT_STYLES
            ZSH_HIGHLIGHT_STYLES[path]='none'
            ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
            ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

            # Keybind para aceptar autosuggestions con Ctrl+L
            bindkey '^L' autosuggest-accept

            # Prompt nativo con integración de Git (vcs_info)
            setopt PROMPT_SUBST
            autoload -Uz vcs_info
            precmd() { vcs_info }
            zstyle ':vcs_info:git:*' formats ' (%F{blue}%b%f)'

            PROMPT='%F{green}%~%f''${vcs_info_msg_0_} %(?.%F{green}.%F{red})λ%f '
            '';
    };
}
