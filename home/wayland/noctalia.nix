{self, ...}: {
  programs.noctalia = {
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        default.path = "${self.outPath}/wallpapers/nixos.png";
      };
    };
  };
}
