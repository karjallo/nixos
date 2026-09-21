{ pkgs, lib, ... }:
{

    imports = [
        # ./modules/waybar.nix
        ./modules/zsh.nix
        ./modules/noctalia.nix
        ./modules/dotfiles.nix
        ./modules/flatpak.nix
    ];

    home.username = "karjallo";
    home.homeDirectory = "/home/karjallo";
    home.stateVersion = "26.05";

    home.sessionPath = [
        "$HOME/.config/scripts/bin/"
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        XDG_DATA_DIRS = lib.concatStringsSep ":" [
            "$HOME/.local/share/flatpak/exports/share"
                "/var/lib/flatpak/exports/share"
                "$XDG_DATA_DIRS"
        ];
    };

    home.packages = with pkgs; [
# fonts - cursors
        nerd-fonts.iosevka
            nerd-fonts.iosevka-term
            nerd-fonts.fira-code
            nerd-fonts.jetbrains-mono
            nerd-fonts.victor-mono
            bibata-cursors
            noto-fonts
            noto-fonts-color-emoji # Crucial para renderizar íconos y emojis correctamente
            font-awesome           # Muy usado para íconos de interfaz de usuario
# symbola
# browsers
            surf
            firefox-bin
            qutebrowser
            vimb
# terminal applications
            kitty
            yazi
            btop
            fastfetch
            tree
            fzf
# launcher
            dmenu
            rofi
# IDE - text editor
            neovim
            vscodium
            tree-sitter
# build - develop
            jq
            gnumake
            gh
            gcc
            cargo
            rustc
            python3
            php
# display
            nwg-displays
# misc - tools
            killall
            hyprpaper
            wl-clipboard
# notificaciones
            libnotify
# net
            nethogs
# screenshots
            grim
            slurp
# dependencias de nvim
            ripgrep
            fd
            lazygit
            trash-cli
            ghostscript
            tectonic
            mermaid-cli
            sqlite
            luarocks
            lua5_1

            clang-tools
            lua-language-server
            pyright
            emmet-ls
            intelephense
            phpstan

            ];

    programs.git = {
        enable = true;
        settings.user.name = "karjallo";
        settings.user.email = "karjallo@disroot.org";
    };

    services.kdeconnect.enable = true;

}
