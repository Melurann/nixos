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
        /*
        height = 30;
        */
        modules-left = [
          "custom/rofi"
          "hyprland/workspaces"
        ];

        modules-center = [
          "custom/weather"
          "clock#date"
        ];

        modules-right = [
          "cpu"
          "memory"
          "temperature"
          "network"
          "backlight"
          "pulseaudio"
          "battery"
          "tray"
          "custom/wallpaper"
          "custom/notification"
          "custom/power"
        ];

        "custom/rofi" = {
          format = " ";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "";
            default = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
          on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
          sort-by-number = true;
          active-only = false;
          persistent-workspaces = {
            "*" = 4;
          };
        };

        "custom/weather" = {
          format = "{}";
          format-alt = "{alt}: {}";
          format-alt-click = "click-right";
          interval = 7200;
          tooltip-format = "Outdoor temperature";
          exec = "curl -s 'https://wttr.in/Vienna?format=1' | tr -s ' '";
          exec-if = "ping wttr.in -c1";
        };
        "clock#date" = {
          format = " {:%H:%M  <span></span> %e %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          today-format = "<b>{}</b>";
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀{bandwidthDownBits:>}{bandwidthUpBits:>}";
          format-disconnected = "󰖪  Disconnected";
          format = "";
          tooltip-format-wifi = " {essid} {frequency}MHz\nStrength: {signaldBm}dBm ({signalStrength}%)\nIP: {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
          on-click-right = "wl-copy $(ip address show up scope global | grep inet6 | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c6-)";
          interval = 10;
        };
        "cpu" = {
          format = "{usage: >3}%";
          on-click = "kitty -e btop";
          interval = 1;
        };
        "memory" = {
          format = "  {used}GB";
          on-click = "kitty -e btop";
        };
        "temperature" = {
          critical-threshold = 80;
          format-critical = " {temperatureC}°C";
          format = " {temperatureC}°C";
          on-click = "kiity -e btop";
        };
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
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
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}% ";
          format-plugged = "{icon} {capacity}% ";
          format-full = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "tray" = {
          icon-size = 15;
          spacing = 5;
        };
        "custom/wallpaper" = {
          format = "🎨";
          on-click = "sleep 0.1 && waypaper --random";
          on-click-right = "sleep 0.1 && waypaper";
        };

        "custom/notification" = {
          format = "🔔";
          tooltip-format = "Notifications";
          on-click = "sleep && swaync-client -rs && swaync-client -t";
        };
        "custom/power" = {
          format = "⏻";
          on-click = "sleep 0.1 && loginctl lock-session && hyprlock";
          tooltip = false;
        };
      }
    ];
  };
}
