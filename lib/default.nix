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

    getTheme = name:
      themes.${name} or (throw "Theme '${name}' not found. Available: ${toString themeNames}");
  }
