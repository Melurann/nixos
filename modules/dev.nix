{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    wireguard-tools
    eza
    oh-my-zsh
    zsh
    starship
    fzf
    ripgrep
    cloc
    docker
    bat
    gh
    jq
    zip
    unzip
    gnupg
    direnv
    git
    zoxide
    bat
    neofetch
    delta
    ffmpeg
    sass
    virtualenv # <https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments>

    # tui
    typioca
    binsider
    pipes-rs
    gpg-tui
    tmux
    lazygit
    btop
    neovim
    yazi
    zellij
    minicom

    # gui
    vscode
    jetbrains.rider
    jetbrains.idea
  ];
}
