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

    ../nixos/programs/wm/hyprland.nix

    ../modules
  ];

  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "vboxusers" "docker"];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # home-manager enables the shell
  };

  system.stateVersion = "25.05";
}
