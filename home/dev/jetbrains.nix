{pkgs, ...}: let
  downloadPlugin = {
    name,
    version,
    url,
    hash,
  }:
    pkgs.stdenv.mkDerivation {
      inherit name version;
      src = pkgs.fetchzip {
        inherit url hash;
      };
      installPhase = ''
        mkdir -p $out
        cp -r . $out
      '';
    };

  catppuccin = downloadPlugin {
    name = "catppuccin";
    version = "3.4.0";
    url = "https://downloads.marketplace.jetbrains.com/files/18682/633467/Catppuccin_Theme-3.4.0.zip";
    hash = "sha256-a26wxw2/pJHt3SwNl0lzD/koKP77EhWpfNe3vw2rBco=";
  };
in {
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.datagrip [
      catppuccin
      "github-copilot"
    ])

    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [
      catppuccin
      "github-copilot"
    ])
  ];
}
