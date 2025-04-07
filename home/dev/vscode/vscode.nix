{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = {
      "files.autoSave" = "onFocusChange";
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.editorActionsLocation" = "hidden";
      "workbench.tree.indent" = 20;
      "workbench.iconTheme" = "material-icon-theme";
      "nasm.outputFormat" = "elf64";
    };

    extensions =
      (import ./extensions.nix {inherit pkgs;}).general
      ++ (import ./extensions.nix {inherit pkgs;}).nix;

    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}
