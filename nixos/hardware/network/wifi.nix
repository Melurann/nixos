#- <https://wiki.nixos.org/wiki/Wpa_supplicant>
_: {
  # To be able to use wpa_gui or wpa_cli
  # Can not use networking.networkmanager with networking.wireless
  networking.wireless = {
    enable = false;
    userControlled.enable = true;
  };
}
