{
  inputs,
  pkgs,
  ...
}: let
  lib = inputs.nixpkgs.lib;

  # Theme management
  themesDir = ../themes;
  themeNames = builtins.attrNames (builtins.readDir themesDir);
  themes = lib.genAttrs themeNames (
    name:
      import (themesDir + "/${name}") {inherit lib pkgs;}
  );
in
  lib
  // rec {
    filesInDirectoryWithSuffix = directory: suffix:
      lib.pipe (lib.filesystem.listFilesRecursive directory) [
        (builtins.filter (name: lib.hasSuffix suffix name))
      ];

    inherit themes;

    # Themeloader
    getTheme = name:
      themes.${name} or (throw "Theme '${name}' not found. Available: ${toString themeNames}");

    # Monitor management
    getPrimaryMonitorObj = monitors: let
      primaryMonitors = lib.filter (m: m ? primary && m.primary) monitors;
      internalMonitors = lib.filter (m: m ? internal && m.internal) monitors;
      targets =
        if primaryMonitors != []
        then primaryMonitors
        else internalMonitors;
    in
      if targets != []
      then builtins.head targets
      else throw "No primary or internal monitor specified in host monitors list!";

    getMonitorBounds = monitor: let
      dims = lib.splitString "x" monitor.dimensions;
      rawW = builtins.fromJSON (builtins.elemAt dims 0);
      rawH = builtins.fromJSON (builtins.elemAt dims 1);
      s = monitor.scale or 1;
    in {
      width = rawW / s;
      height = rawH / s;
    };
  }
