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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-jetbrains-plugins = {
      url = "github:nix-community/nix-jetbrains-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    lib = import ./lib {inherit inputs pkgs;};

    # Global user
    user = {
      name = "fruroa";
      homeDir = "/home/fruroa";
    };

    # Hosts
    hosts = [
      {
        name = "fujitsu-laptop";
        system = {
          os = "linux";
          desktop = "wayland";
        };
        theme = lib.getTheme "catppuccin-mocha";
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

    # build each host
    forLinuxHosts = host: {
      name = host.name;
      value = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;

          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
            theme = host.theme;
          };

          inherit user;
        };

        modules = [
          stylix.nixosModules.stylix
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
                inherit user;
              };
            };
          }

          ./hosts/configuration.nix
        ];
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map forLinuxHosts hosts);
  };
}
