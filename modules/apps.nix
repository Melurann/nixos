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

    # waybar
    waybar
    pavucontrol
    swaynotificationcenter

    # hypr
    wofi
    hypridle
    hyprlock
    hyprpaper
    hyprutils
    hyprcursor
  ];
}
