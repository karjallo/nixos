{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.config/nixos/dotfiles";
in
{
  home.packages = [
    (pkgs.rofi.override { plugins = [ pkgs.rofi-calc ]; })
  ];

  xdg.configFile."rofi".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
}
