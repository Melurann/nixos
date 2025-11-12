{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    grimblast
    swappy
    wl-clipboard-rs
    pulseaudio
    alsa-utils
  ];
}
