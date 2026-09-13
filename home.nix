{ pkgs, ... }:
{

  imports = [
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/noctalia.nix
    ./modules/dotfiles.nix
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
    firefox-bin
    qutebrowser
    vimb
    # terminal applications
    kitty
    yazi
    btop
    fastfetch
    tree
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

  ];

  programs.git = {
    enable = true;
    settings.user.name = "karjallo";
    settings.user.email = "karjallo@disroot.org";
  };

}
