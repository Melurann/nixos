{
  user,
  inputs,
  ...
}: {
  imports = [
    ../home

    inputs.walker.homeManagerModules.default
  ];

  home = {
    username = user.name;
    homeDirectory = user.homeDir;
    stateVersion = "25.05";
  };
}
