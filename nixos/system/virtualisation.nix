_: {
  virtualisation = {
    libvirtd.enable = false;

    virtualbox = {
      host = {
        enable = false;
        enableExtensionPack = false;
      };

      guest = {
        enable = false;
        dragAndDrop = true;
        seamless = true;
        clipboard = true;
      };
    };
  };
}
