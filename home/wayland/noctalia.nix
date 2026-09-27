{
  self,
  lib,
  ...
}: {
  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";

        # lib.mkForce is required here to override the default theme.source ("custom")
        # set by the system-level recommendedServices option in NixOS configuration
        source = lib.mkForce "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        default.path = "${self.outPath}/wallpapers/nixos.png";
      };
    };
  };
}
