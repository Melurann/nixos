_: {
  # https://wiki.nixos.org/wiki/Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 16;

      # Allow editing the kernel command-line before boot
      # enabled by default for backwards compatibility
      # Recommended to set this to false,
      # as it allows gaining root access by passing
      # init=/bin/sh as a kernel parameter
      editor = false;

      consoleMode = "auto";
    };

    efi.canTouchEfiVariables = true;
  };
}
