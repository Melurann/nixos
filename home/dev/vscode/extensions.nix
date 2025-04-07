{pkgs}: {
  general = with pkgs.vscode-extensions; [
    github.copilot
    catppuccin.catppuccin-vsc
    pkief.material-icon-theme
  ];

  nix = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    kamadorueda.alejandra
  ];

  svelte = with pkgs.vscode-extensions; [
    svelte.svelte-vscode
    bradlc.vscode-tailwindcss
  ];

  java = with pkgs.vscode-extensions; [
    vscjava.vscode-java-pack
    redhat.java
    visualstudioexptteam.vscodeintellicode
    vscjava.vscode-java-debug
    vscjava.vscode-gradle
    vscjava.vscode-java-dependency
    vscjava.vscode-java-test
  ];

  c = with pkgs.vscode-extensions; [
    ms-vscode.cpptools
    twxs.cmake
    vadimcn.vscode-lldb
    xaver.clang-format
    usernamehw.errorlens
  ];

  assembly = with pkgs; [
    (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "nasm-language-support";
        publisher = "doinkythederp";
        version = "1.2.0";
        hash = "sha256-7a2ipGk8MzgJrIkcpZpjCjmZjIaiIg6uzDFnCTJToNA=";
      };
    })
  ];

  react = [
    (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "simple-react-snippets";
        publisher = "burkeholland";
        version = "1.2.8";
        hash = "sha256-zrRxJZHRqBMGVkd56Q+wDbCSFfl4X3Kta4sX8ecZmu8=";
      };
    })
  ];
}
