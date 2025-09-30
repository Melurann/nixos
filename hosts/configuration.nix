{
  inputs,
  pkgs,
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

  users.users.fruroa = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "vboxusers"];
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  system.stateVersion = "25.05";
}
