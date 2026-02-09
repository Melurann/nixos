#<https://wiki.nixos.org/wiki/PipeWire>
_: {
  # use the realtime scheduler for increased performance
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 512;
        };
      };
    };
  };
}
