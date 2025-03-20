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

  minecraftDev = downloadPlugin {
    name = "minecraft-development";
    version = "1.8.2";
    url = "https://downloads.marketplace.jetbrains.com/files/8327/615097/Minecraft_Development-2024.3-1.8.2.zip";
    hash = "sha256-4c1nxjbEsNs9twmQnJllk1OIVmm0nnUYZ0R7f/6bJt4=";
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
      minecraftDev
    ])
  ];

  home.file.".config/JetBrains/IntelliJIdea2024.1/options/ui.lnf.xml".text = ''
    <application>
      <component name="LafManager">
        <laf class-name="Catppuccin Mocha" />
      </component>
    </application>
  '';

  home.file.".config/JetBrains/IntelliJIdea2024.1/options/editor.xml".text = ''
    <application>
      <component name="EditorColorsManager">
        <global_color_scheme name="Catppuccin Mocha" />
      </component>
    </application>
  '';
}
