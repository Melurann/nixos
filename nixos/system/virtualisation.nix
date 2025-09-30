_: {
  virtualisation = {
    libvirtd.enable = false;

    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };

      guest = {
        enable = true;
        dragAndDrop = true;
        seamless = true;
        clipboard = true;
      };
    };
  };
}
