{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        "nasm.outputFormat" = "elf64";

        # "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.editor.editorActionsLocation" = "hidden";
        "workbench.tree.indent" = 20;
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.activityBar.location" = "hidden";
        "workbench.sideBar.location" = "right";
      };

      extensions = with pkgs.vscode-extensions; [
        # general
        vscodevim.vim
        github.copilot
        catppuccin.catppuccin-vsc
        pkief.material-icon-theme

        # nix
        jnoortheen.nix-ide
        kamadorueda.alejandra

        # frontEnd
        bradlc.vscode-tailwindcss

        # get newest version etc. instead somehow
        (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            name = "simple-react-snippets";
            publisher = "burkeholland";
            version = "1.2.8";
            hash = "sha256-zrRxJZHRqBMGVkd56Q+wDbCSFfl4X3Kta4sX8ecZmu8=";
          };
        })
      ];
    };

    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}
