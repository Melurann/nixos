{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = {
      "files.autoSave" = "onFocusChange";
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.editorActionsLocation" = "hidden";
      "workbench.tree.indent" = 20;
    };
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      svelte.svelte-vscode
      bradlc.vscode-tailwindcss
      vscodevim.vim
    ];
    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}
