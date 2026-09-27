_: {
  imports = [
    # ./services/hyprpaper.nix
    # ./services/hypridle.nix
    # ./services/hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };

  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
