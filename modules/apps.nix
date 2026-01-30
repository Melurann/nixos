{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    discord
    onlyoffice-desktopeditors
    brave
    ghostty
    nautilus
    wireshark
    ghidra
    burpsuite
    _1password-gui
    spotify
    gimp

    # waybar
    waybar
    pavucontrol
    swaynotificationcenter
    networkmanagerapplet

    # hypr
    wofi
    hypridle
    hyprlock
    hyprpaper
    hyprutils
    hyprcursor
  ];
}
