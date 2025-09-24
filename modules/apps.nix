{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    discord
    onlyoffice-desktopeditors
    brave
    ghostty
    nautilus
    wireguard-ui

    # waybar
    waybar

    # hypr
    wofi
    hypridle
    hyprlock
    hyprpaper
    hyprutils
    hyprcursor
  ];
}
