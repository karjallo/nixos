{ pkgs, lib, ... }:
{

    imports = [
        # ./modules/waybar.nix
        ./modules/zsh.nix
        ./modules/noctalia.nix
        ./modules/dotfiles.nix
        ./modules/flatpak.nix
        ./modules/rofi.nix
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
            noto-fonts-color-emoji
            font-awesome
            # browsers
            surf
            firefox-bin
            qutebrowser
            vimb
            # wine/games
            wineWow64Packages.staging
            winetricks
            umu-launcher
            # terminal applications
            kitty
            yazi
            btop
            fastfetch
            tree
            fzf
            # launcher
            dmenu
            # rofi tiene modulo aparte

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
            # video
            mpv
            # misc - tools
            killall
            hyprpaper
            wl-clipboard
            unar
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

            # dependencias de obs
            qt6.qtwayland
            ];

    programs.git = {
        enable = true;
        settings.user.name = "karjallo";
        settings.user.email = "karjallo@disroot.org";
    };

    programs.obs-studio = {
        enable = true;

        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
                obs-backgroundremoval
                obs-pipewire-audio-capture
                obs-vaapi
                obs-gstreamer
                obs-vkcapture
        ];
    };

    services.kdeconnect.enable = true;

}
