{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 8;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%a, %d.%m.%Y}";
          tooltip = true;
        };

        cpu = {
          format = " {usage}%";
        };

        memory = {
          format = " {}%";
        };

        pulseaudio = {
          format = " {volume}%";
          format-muted = " muted";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = " {essid}";
          format-ethernet = "󰈀 wired";
          format-disconnected = "󰖪 offline";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.78);
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 10px;
        color: #cdd6f4;
        background: transparent;
      }

      #workspaces button.active {
        color: #cba6f7;
      }

      #clock,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #battery,
      #tray {
        padding: 0 10px;
        margin: 5px 3px;
        border-radius: 10px;
        background: rgba(49, 50, 68, 0.85);
      }
    '';
  };
}
