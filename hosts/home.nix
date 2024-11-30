{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ../home
  ];

  # Home Manager needs a bit of information about you and the paths it should
  home.username = "fruth";
  home.homeDirectory = "/home/fruth";

  # This value determines the Home Manager release that your configuration is
  targets.genericLinux.enable = true;
  home.activation = {
    linkDesktopApplications = {
      after = ["writeBoundary" "createXdgUserDirectories"];
      before = [];
      data = '''';
    };
  };

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05";

  # Set global font configurations
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["Hack nerd Font"];
      sansSerif = ["Hack nerd Font"];
      serif = ["Hack nerd Font"];
    };
  };

  # Set GTK theme for the user
  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = ["normal"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
