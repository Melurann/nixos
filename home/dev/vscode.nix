{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
    ];
    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}
