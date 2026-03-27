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
    ../nixos/hardware/gpu/intel.nix

    ../modules
  ];

  boot.blacklistedKernelModules = ["kvm" "kvm_intel" "kvm_amd"];
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
