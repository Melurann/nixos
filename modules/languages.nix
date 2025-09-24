{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    rustup
    go_1_24
    air
    nodejs
    yarn
    python313
    nil
    alejandra
    bash-language-server
    typescript-language-server
    tailwindcss-language-server
    lua-language-server
    vscode-langservers-extracted
    marksman
    yaml-language-server
  ];
}
