_: {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      ipc = true;

      wallpaper = [
        {
          monitor = "";
          path = "${../../../wallpapers/nixos.png}";
          fit_mode = "cover";
        }
      ];
    };
  };
}
