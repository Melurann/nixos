{
  pkgs,
  inputs,
  ...
}: let
  withPlugins = inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs;
in {
  home.packages = [
    ((withPlugins "idea" [
      "com.github.copilot"
      "com.mallowigi"
    ]).overrideAttrs {preferLocalBuild = true;})
  ];

  # xdg.configFile."gdb/gdbinit".text = ''
  #   set auto-load local-gdbinit on
  #   add-auto-load-safe-path /
  # '';
}
