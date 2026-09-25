{ config, pkgs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/.config/nixos/dotfiles";
in
{
	programs.rofi = {
		enable = true;
		plugins = with pkgs; [
            rofi-calc
		];
	};

    xdg.configFile."rofi".source =
        config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
}
