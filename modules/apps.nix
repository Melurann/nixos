{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    # discord
    onlyoffice-desktopeditors
    brave
    ghostty
    nautilus
    wireshark
    ghidra
    burpsuite
    binaryninja-free
    _1password-gui
    gimp
    # ciscoPacketTracer9

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
