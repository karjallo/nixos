# waybar.nix
{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar-git;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          # "clock"
        ];
        modules-right = [
          "pulseaudio"
          # "network"
          "cpu"
          "memory"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
          on-click = "activate";
        };

        "clock" = {
          format = "󰥔 {:%H:%M - %d/%m/%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = " {usage}%";
          interval = 2;
        };

        "memory" = {
          format = " {percentage}%";
          interval = 2;
        };

        "network" = {
          format-wifi = "󰤨 {essid}";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-disconnected = "󰤭 Disconnected";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "FiraCode Nerd Font, monospace";
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(26, 27, 38, 0.85);
        color: #c0caf5;
      }

      #workspaces button {
        padding: 0 8px;
        background-color: transparent;
        color: #a9b1d6;
      }

      #workspaces button.active {
        color: #7aa2f7;
        border-bottom: 2px solid #7aa2f7;
      }

      #clock, #cpu, #memory, #network, #pulseaudio, #tray {
        padding: 0 10px;
        margin: 3px 2px;
        border-radius: 4px;
        background-color: #24283b;
        color: #c0caf5;
      }
    '';
  };
}
