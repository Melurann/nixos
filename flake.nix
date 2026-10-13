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

    niri-flake = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
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

    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    titanium-proxy.url = "git+ssh://git@github.com/Melurann/titanium-proxy.git";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    niri-flake,
    home-manager,
    stylix,
    noctalia,
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
          compositor = "hyprland"; # "niri" or "hyprland"
        };
        theme = lib.getTheme "catppuccin-mocha";
        monitors = [
          {
            name = "eDP-1";
            dimensions = "1920x1080";
            position = "0x0";
            scale = 1;
            framerate = 60;
            transform = 0;
            primary = true;
            internal = true;
          }
          {
            name = "HDMI-A-1";
            dimensions = "1920x1080";
            position = "1920x0";
            scale = 1;
            framerate = 60;
            transform = 0;
            primary = false;
            internal = false;
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
          inherit inputs user;

          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
            theme = host.theme;
          };
        };

        modules = [
          niri-flake.nixosModules.niri
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          noctalia.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${user.name} = import ./hosts/home.nix;
              extraSpecialArgs = {
                inherit inputs user self;
                nixlib = lib;
                meta = host;
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
