{...}: {
  home.file.".config/waybar/modules" = {
    source = ./modules;
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./styles.css;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "custom/menu"
          "hyprland/workspaces"
          "wlr/taskbar"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "custom/weather"

          "memory"

          "pulseaudio"
          "backlight"
          "bluetooth"
          "network"
          "battery"

          # "tray"
          "custom/wallpaper"
          "custom/notification"
          "custom/power"
        ];

        "custom/menu" = {
          format = "    "; # Use NixOS logo
          on-click = "wofi --show drun -I -m -i";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          active-only = false;
          all-outputs = true;
          on-click = "hyprctl dispatch workspace {name}";
          on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
          on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
          persistent-workspaces = {
            "*" = 3;
          };
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 18;
          spacing = 5;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
        };

        "clock" = {
          format = "<b>{:%I:%M %p - %a.%d.%b}</b>";
          tooltip = false;
        };

        "custom/weather" = {
          format = "{}";
          interval = 7200;
          exec = "curl -s 'https://wttr.in/kalsdorf?format=1' | tr -s ' '";
          tooltip = false;
        };

        "memory" = {
          format = "  {used}GB";
          on-click = "kitty -e btop";
        };

        "pulseaudio" = {
          scroll-step = 3;
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
          on-click-right = "amixer sset Master toggle";
          tooltip = false;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          tooltip = false;
        };

        "bluetooth" = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = " {device_alias}";
          format-off = "󰂲";
          interval = 30;
          on-click = "blueman-manager";
          on-click-right = "sleep 0.1 && kill -9 $pgrep blueman-applet";
          tooltip-format = "{status}";
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "";
          format-wifi-alt = "  {essid}";
          format-ethernet = "󰈀{bandwidthDownBits:>}{bandwidthUpBits:>}";
          format-disconnected = "󰖪  Disconnected";
          format-disabled = "  Offline";
          tooltip-format-wifi = " {essid} {frequency}MHz\nStrength: {signaldBm}dBm ({signalStrength}%)\nIP: {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
          max-length = 20;
          on-click = "sleep 0.1 && nm-connection-editor";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-alt = "{icon}";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          interval = 1;
          states = {
            warning = 20;
            critical = 4;
          };
          format-icons = [
            "󰂎"
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

        "tray" = {
          icon-size = 15;
          spacing = 5;
          show-passive-items = false;
        };

        "custom/wallpaper" = {
          format = "🎨";
          on-click = "sleep 0.1 && waypaper --random";
          on-click-right = "sleep 0.1 && waypaper";
        };

        "custom/notification" = {
          format = "🔔";
          tooltip-format = "Notifications";
          on-click = "sleep 0.1 && swaync-client -rs && swaync-client -t";
        };

        "custom/power" = {
          format = "⏻ ";
          on-click = "sleep 0.1 && loginctl lock-session && hyprlock";
          tooltip = false;
        };
      }
    ];
  };
}
