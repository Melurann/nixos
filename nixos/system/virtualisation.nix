_: {
  virtualisation = {
    libvirtd.enable = true;

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
