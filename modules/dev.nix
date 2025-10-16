{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
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
  ];
}
