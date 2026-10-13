{
  self,
  lib,
  nixlib,
  meta,
  user,
  ...
}: let
  primaryMon = nixlib.getPrimaryMonitorObj meta.monitors;
  bounds = nixlib.getMonitorBounds primaryMon;

  preset = import ./presets/preset-1 {inherit bounds primaryMon user;};
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

      lockscreen_widgets = preset.lockscreen_widgets;
    };
  };
}
