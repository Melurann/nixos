{
  description = "NixOS basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    # ------------------------------------
    # Global user
    # ------------------------------------
    user = {
      name = "fruroa";
      homeDir = "/home/fruroa";
    };

    # ------------------------------------
    # Hosts
    # ------------------------------------
    hosts = [
      {
        name = "fujitsu-laptop";
        system = {
          os = "linux";
          desktop = "wayland";
        };
        monitors = [
          {
            name = "HDMI-A-1";
            dimensions = "1920x1080";
            scale = 1;
            primary = true;
            internal = true;
            framerate = 60;
            transform = 0;
          }
        ];
      }
    ];

    # ------------------------------------
    # build each host
    # ------------------------------------
    forLinuxHosts = host: {
      name = host.name;
      value = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
          };
          user = user;
        };

        modules = [
          ./hosts/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${user.name} = import ./hosts/home.nix;
              extraSpecialArgs = {
                inherit inputs;
                meta = host;
                user = user;
              };
            };
          }
        ];
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map forLinuxHosts hosts);
  };
}
