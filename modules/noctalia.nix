# modules/noctalia.nix
{ inputs, ... }:
{
    imports = [
        inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
        enable = true;
        settings = {
            theme = {
                mode = "dark";
                source = "builtin";
                builtin = "Catppuccin";
            };
            wallpaper = {
                enabled = true;
                default.path = "~/Pictures/wallpapers/chainsmoker.jpg";
            };
            bar = {
                default = {

                    margin_ends = 10;
                    # widgets
                    start = ["workspaces" "active_window"];
                    center = [];
                    end = ["tray" "notifications" "clipboard" "volume" "clock" "control-center" "session"];
                };
            };
            widget = {
                active_window = {
                    min_length = 80;
                    max_length = 500;
                    icon_size = 14;
                    title_scroll = "on_hover"; # none - always
                    display = "icon_and_text"; # text_only - icon_only
                    show_empty_label = false; # true
                };
            };
            shell = {
                screenshot = {
                    directory = "~/Pictures/screenshots/";
                };
            };
        };
    };
}
