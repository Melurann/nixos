{ config, pkgs, ... }:

{
  imports = [
    # Ensure Home Manager is properly included
    ../home
  ];

  # Information for Home Manager
  home.username = "fruth";
  home.homeDirectory = "/home/fruth";

  # Discard mismatched versions
  home.enableNixpkgsReleaseCheck = false;

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

  # Ensure Home Manager itself is managed
  programs.home-manager.enable = true;

  # Set Home Manager version
  home.stateVersion = "24.05";
}
