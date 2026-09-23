{
  pkgs,
  lib,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch-unwrapped;

    # Fastfetch configuration
    # See: https://github.com/fastfetch-cli/fastfetch/wiki/Configuration
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        padding = {
          top = 0;
        };
      };
      display = {
        color = {
          keys = "green";
          title = "blue";
        };
        percent = {
          type = 9;
        };
        separator = " 󰁔 ";
      };

      modules =
        [
          {
            type = "custom";
            outputColor = "blue";
            format = "┌──────────── OS Information ────────────┐";
          }
          {
            type = "title";
            key = " ╭─ ";
            keyColor = "green";
            color = {
              user = "green";
              host = "green";
            };
          }
        ]
        ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
          {
            type = "os";
            key = " ├─ ";
            keyColor = "green";
          }
          {
            type = "kernel";
            key = " ├─ ";
            keyColor = "green";
          }
          {
            type = "packages";
            key = " ├─ ";
            keyColor = "green";
          }
        ]
        ++ [
          {
            type = "shell";
            key = " ╰─ ";
            keyColor = "green";
          }
          {
            type = "custom";
            outputColor = "blue";
            format = "├───────── Hardware Information ─────────┤";
          }
          {
            type = "display";
            key = " ╭─ 󰍹";
            keyColor = "blue";
            compactType = "original-with-refresh-rate";
          }
          {
            type = "cpu";
            key = " ├─ 󰍛";
            keyColor = "blue";
            format = "{1}";
          }
          {
            type = "gpu";
            key = " ├─ ";
            keyColor = "blue";
            format = "{2}";
          }
          {
            type = "disk";
            key = " ├─ 󱛟";
            keyColor = "blue";
            format = "{1} / {2} ({3})";
          }
          {
            type = "memory";
            key = " ├─ ";
            keyColor = "blue";
            format = "{1} / {2} ({3})";
          }
          {
            type = "battery";
            key = " ╰─ 󰂂";
            keyColor = "blue";
            format = "{4} ({5})";
          }
          {
            type = "custom";
            outputColor = "blue";
            format = "├───────── Software Information ─────────┤";
          }
          {
            type = "wm";
            key = " ╭─ ";
            keyColor = "yellow";
          }
          {
            type = "terminal";
            key = " ├─ ";
            keyColor = "yellow";
          }
          {
            type = "font";
            key = " ╰─ ";
            keyColor = "yellow";
          }
          {
            type = "custom";
            outputColor = "blue";
            format = "└────────────────────────────────────────┘";
          }
          "break"
        ];
    };
  };
}
