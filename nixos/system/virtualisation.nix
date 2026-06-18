_: {
  virtualisation = {
    libvirtd.enable = true;

    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
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
