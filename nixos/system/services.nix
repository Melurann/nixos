{pkgs, ...}: {
  services = {
    # <https://wiki.nixos.org/wiki/Nautilus#Mount,_trash,_and_other_virtual_filesystems>
    gvfs.enable = true; # Mount, trash, and other functionalities
    udisks2.enable = true;
    devmon.enable = true;

    tumbler.enable = true; # Thumbnail support for images

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
          user = "greeter";
        };
      };
    };

    # <https://nixos.wiki/wiki/Logind>
    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      # hard reset is handeled by BIOS/EFI and thus still possible
      HandlePowerKey = "ignore";
      HandlePowerKeyLongPress = "poweroff";
    };
  };
}
