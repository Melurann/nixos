_: {
  imports = [
    ../home
  ];

  home.username = "fruroa";
  home.homeDirectory = "/home/fruroa";
  home.stateVersion = "25.05";

  programs.git.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      san = "echo sanity check o.O";
    };
  };
}
