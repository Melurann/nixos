{
  user,
  self,
  lib,
  meta,
  nixlib,
  ...
}: let
  primaryMon = nixlib.getPrimaryMonitorObj meta.monitors;
  bounds = nixlib.getMonitorBounds primaryMon;
in {
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = lib.mkForce "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        default.path = "${self.outPath}/wallpapers/nixos.png";
      };

      location = {
        auto_locate = false;
        address = "Vienna, Austria";
      };

      weather = {
        enabled = true;
        refresh_minutes = 30;
        unit = "metric";
        effects = true;
      };

      bar = import ./components/bar.nix {
        inherit primaryMon bounds;
      };

      lockscreen_widgets = import ./components/lockscreen-widgets.nix {
        inherit user primaryMon bounds;
      };
    };
  };
}
