{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = {
      "files.autoSave" = "onFocusChange";
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Catppuccin Mocha";
    };
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
