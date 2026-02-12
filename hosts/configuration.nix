{
  inputs,
  pkgs,
  user,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default

    ./hardware-configuration.nix
    ../nixos
    ../modules
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["kvm" "kvm_intel" "kvm_amd"];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Vienna";

  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "vboxusers" "docker"];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # home-manager enables the shell
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
  };

  system.stateVersion = "25.05";
}
