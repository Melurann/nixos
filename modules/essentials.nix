{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    grimblast
    swappy
  ];
}
