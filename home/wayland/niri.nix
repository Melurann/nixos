{
  pkgs,
  lib,
  ...
}: {
  programs.niri = {
    settings = {
      outputs = {
        "HDMI-A-1" = {
          scale = 1;
          position = {
            x = 0;
            y = 0;
          };
        };
        "eDP-1" = {
          scale = 1;
          position = {
            x = 1920;
            y = 0;
          };
        };
      };

      input = {
        keyboard.xkb = {
          layout = "us(euro), de";
          options = "grp:lalt_lshift_toggle";
        };

        mouse = {
          enable = true;
          middle-emulation = false; # left and right mouse buttons = middle mouse button
          natural-scroll = true;
        };

        touchpad = {
          enable = true;
          dwt = true; # disable while typing
          middle-emulation = false; # left and right mouse buttons = middle mouse button
          natural-scroll = true;
        };

        power-key-handling.enable = false; # doing this somewhere else
      };

      prefer-no-csd = true;
      cursor.hide-when-typing = true;

      layout = {
        gaps = 2;

        border = {
          enable = true;
          width = 2;
          active = {color = lib.mkDefault "#7287fdaa";};
          inactive = {color = lib.mkDefault "#414550aa";};
        };
      };

      animations.enable = true;

      spawn-at-startup = [
        {argv = ["${lib.getExe pkgs.waybar}"];}
        {argv = ["${lib.getExe pkgs.hyprpaper}"];}
        {argv = ["${lib.getExe pkgs.hypridle}"];}
        {argv = ["${lib.getExe pkgs.brave}"];}
        {argv = ["${lib.getExe pkgs.ghostty}"];}
      ];

      binds = {
        # Launch Applications
        "Super+E".action.spawn-sh = "${lib.getExe pkgs.wofi} --show drun -I";
        "Super+Shift+E".action.spawn-sh = "${lib.getExe pkgs.wofi} --show=run";
        "Super+Shift+N".action.spawn-sh = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
        "Super+Q".action.spawn-sh = "${lib.getExe pkgs.ghostty}";
        "Super+B".action.spawn-sh = "${lib.getExe pkgs.brave}";
        "Super+D".action.spawn-sh = "${lib.getExe pkgs.vesktop}";
        "Super+F".action.spawn-sh = "${lib.getExe pkgs.nautilus}";
        "Super+S".action.spawn-sh = "spotify";
        "Super+P".action.spawn-sh = "${lib.getExe pkgs._1password-gui}";

        # Audio controls
        "Super+V".action.spawn-sh = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "Super+U".action.spawn-sh = "${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "Super+A".action.spawn-sh = "${lib.getExe pkgs.pavucontrol}";

        "XF86AudioMute".action.spawn-sh = "${pkgs.avizo}/bin/volumectl toggle-mute";
        "XF86AudioMicMute".action.spawn-sh = "${pkgs.avizo}/bin/volumectl -m toggle-mute";
        "XF86AudioRaiseVolume".action.spawn-sh = "${pkgs.avizo}/bin/volumectl -u up";
        "XF86AudioLowerVolume".action.spawn-sh = "${pkgs.avizo}/bin/volumectl -u down";

        # Brightness
        "XF86MonBrightnessUp".action.spawn-sh = "${pkgs.avizo}/bin/lightctl up";
        "XF86MonBrightnessDown".action.spawn-sh = "${pkgs.avizo}/bin/lightctl down";

        # Bluetooth and network
        "Super+Shift+B".action.spawn-sh = "${pkgs.blueman}/bin/blueman-manager";
        "Super+W".action.spawn-sh = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";

        # Lock screen
        "Super+Shift+C".action.spawn-sh = "pidof ${lib.getExe pkgs.hyprlock} || ${lib.getExe pkgs.hyprlock}";

        # Window management
        "Super+C".action.close-window = [];
        "Super+Shift+M".action.fullscreen-window = [];
        "Super+M".action.maximize-column = [];
        "Super+Equal".action.set-column-width = "+10%";
        "Super+Minus".action.set-column-width = "-10%";
        "Super+Shift+Equal".action.set-window-height = "+10%";
        "Super+Shift+Minus".action.set-window-height = "-10%";

        # Move focus
        "Super+H".action.focus-column-left = [];
        "Super+L".action.focus-column-right = [];
        "Super+K".action.focus-window-up = [];
        "Super+J".action.focus-window-down = [];
        "Super+Left".action.focus-column-left = [];
        "Super+Right".action.focus-column-right = [];
        "Super+Up".action.focus-window-up = [];
        "Super+Down".action.focus-window-down = [];

        # Move windows
        "Super+Shift+H".action.move-column-left = [];
        "Super+Shift+L".action.move-column-right = [];
        "Super+Shift+K".action.move-window-up = [];
        "Super+Shift+J".action.move-window-down = [];
        "Super+Shift+Left".action.move-column-left = [];
        "Super+Shift+Right".action.move-column-right = [];
        "Super+Shift+Up".action.move-window-up = [];
        "Super+Shift+Down".action.move-window-down = [];

        # Workspaces
        "Super+1".action.focus-workspace = 1;
        "Super+2".action.focus-workspace = 2;
        "Super+3".action.focus-workspace = 3;
        "Super+4".action.focus-workspace = 4;
        "Super+5".action.focus-workspace = 5;
        "Super+6".action.focus-workspace = 6;
        "Super+7".action.focus-workspace = 7;
        "Super+8".action.focus-workspace = 8;
        "Super+9".action.focus-workspace = 9;
        "Super+0".action.focus-workspace = 10;

        # Move windows to workspaces
        "Super+Shift+1".action.move-window-to-workspace = 1;
        "Super+Shift+2".action.move-window-to-workspace = 2;
        "Super+Shift+3".action.move-window-to-workspace = 3;
        "Super+Shift+4".action.move-window-to-workspace = 4;
        "Super+Shift+5".action.move-window-to-workspace = 5;
        "Super+Shift+6".action.move-window-to-workspace = 6;
        "Super+Shift+7".action.move-window-to-workspace = 7;
        "Super+Shift+8".action.move-window-to-workspace = 8;
        "Super+Shift+9".action.move-window-to-workspace = 9;
        "Super+Shift+0".action.move-window-to-workspace = 10;

        # Screenshot
        "Print".action.screenshot = [];
        "Super+Print".action.screenshot-screen = [];
        "Super+Shift+Print".action.screenshot-window = [];
      };
    };
  };
}
