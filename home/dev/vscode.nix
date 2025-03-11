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
    };

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      svelte.svelte-vscode
      bradlc.vscode-tailwindcss
      vscodevim.vim
      pkief.material-icon-theme

      (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          name = "simple-react-snippets";
          publisher = "burkeholland";
          version = "1.2.8";
          hash = "sha256-zrRxJZHRqBMGVkd56Q+wDbCSFfl4X3Kta4sX8ecZmu8=";
        };
      })
    ];

    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}
