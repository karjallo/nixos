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
                    start = ["workspaces"];
                    center = [ ];
                    end = ["tray" "notifications" "clipboard" "volume" "clock" "control-center" "session"];
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
