{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.default
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname
  networking.hostName = "fruth-nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enables wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_AT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."fruth" = {
    isNormalUser = true;
    description = "Roman Fruth";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users = {
      "fruth" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ripgrep
    wl-clipboard-rs
    waybar
    pavucontrol
    avizo
    btop
    brightnessctl
    alsa-utils
    swaynotificationcenter

    # File Managers
    wofi
    nautilus

    # Terminal
    kitty
    fish
    tmux

    # Tools
    gh
    git
    eza

    # Languages
    gcc
    gnumake
    nil
    alejandra

    # Applications
    vesktop
    brave

    # Hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    hyprpaper
    hyprlock
    hypridle

    # Editors
    jetbrains-toolbox
    jetbrains.datagrip
    jetbrains.idea-ultimate
    vscode
    neovim
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
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
  system.stateVersion = "24.05";
}
