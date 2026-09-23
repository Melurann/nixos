_: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };

  # Direct file symlink
  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
