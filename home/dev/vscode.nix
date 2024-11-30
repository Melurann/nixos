{ pkgs, ... }: {
  programs = {
    vscode = {
      enable = true;
      extensions =
        with pkgs; [
          vscode-extensions.ms-vscode.cpptools-extension-pack
        ];
      mutableExtensionsDir = true;
      package = pkgs.vscode;
    };
  };
} 