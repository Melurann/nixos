_: {
  # avizo is an osd notification daemon for audio and backlight
  # avizo provides volumectl and lightctl for controlling audio and backlight
  services = {
    avizo = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      # Work when input inhibitor (l) is active.
      bindl = [
        ", XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioMicMute, exec, volumectl -m toggle-mute"
      ];
      # Work when input inhibitor (l) is active, with repeat (e)
      bindle = [
        ", XF86AudioRaiseVolume, exec, volumectl -u up"
        ", XF86AudioLowerVolume, exec, volumectl -u down"
        ", XF86MonBrightnessUp, exec, lightctl up"
        ", XF86MonBrightnessDown, exec, lightctl down"
      ];
    };
  };
}
