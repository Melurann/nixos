{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "editor.formatOnSave" = true;
    };

    extensions = with pkgs.vscode-extensions; [
      github.copilot
      esbenp.prettier-vscode
      zhuangtongfa.material-theme
      bbenoist.nix
      kamadorueda.alejandra
    ];
    mutableExtensionsDir = true;
    package = pkgs.vscode;
  };
}
