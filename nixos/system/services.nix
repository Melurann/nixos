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
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };
}
