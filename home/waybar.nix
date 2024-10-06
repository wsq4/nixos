{ ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        border: none;
        border-radius: 0;

      }
      window#waybar {
        background: rgba(43, 48, 59, 0.5);
        color: white;
      }
      label.module {
        background: transparent;
        padding: 0 10px;
      }

      #workspaces button.active {
        color: white;
      }

      #workspaces button {
        padding: 0;
      }
    '';
    settings = {
      myBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "cpu" "memory" "disk" "pulseaudio" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "hyprland/window" = {
          "format" = "{}";
          "rewrite" = {
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - fish" = "> [$1]";
          };
          "separate-outputs" = true;
        };

        "clock" = {
          "interval" = 1;
          "format" = "{:%H:%M:%S} ";
          "format-alt" = "{:%b %d %a  %H:%M}";

        };

        "cpu" = {
          "interval" = 1;
          "format" = "{icon}";
          "format-icons" = [
            "<span color='#69ff94'>▁</span>"
            "<span color='#2aa9ff'>▂</span>"
            "<span color='#f8f8f2'>▃</span>"
            "<span color='#f8f8f2'>▄</span>"
            "<span color='#ffffa5'>▅</span>"
            "<span color='#ffffa5'>▆</span>"
            "<span color='#ff9977'>▇</span>"
            "<span color='#dd532e'>█</span>"
          ];
        };

        "disk" = {
          "interval" = 60;
          "format" = "{free} Free ";
          "path" = "/";
        };

        "memory" = {
          "interval" = 3;
          "format" = "{}% ";
          "max-length" = 10;
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "phone-muted" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
          "ignored-sinks" = [ "Easy Effects Sink" ];
        };

        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };

        "network" = {
          "interval" = 1;
          "interface" = "enp6s18";
          "format" = "{bandwidthTotalBytes}";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };
      };
    };
  };
}
