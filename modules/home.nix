{ config, pkgs, ... }:

{
  home.username = "fruth";
  home.homeDirectory = "/home/fruth";

  # Discard mismatched versions
  home.enableNixpkgsReleaseCheck = false;

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05";
}
