{user, ...}: {
  imports = [
    ../home
  ];

  home.username = user.name;
  home.homeDirectory = user.homeDir;
  home.stateVersion = "25.05";

  programs.git.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      san = "echo sanity check o.O";
    };
  };
}
