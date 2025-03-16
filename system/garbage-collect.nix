{...}: {
  # https://wiki.nixos.org/wiki/Storage_optimization#Automation
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 1d";
  };

  # implement file deletion
}
