{user, ...}: {
  imports = [
    ../home
  ];

  home = {
    username = user.name;
    homeDirectory = user.homeDir;
    stateVersion = "25.05";
  };
}
