_: {
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      placeholders."default" = {
        input = "Search";
        list = "Example";
      };

      # https://github.com/abenz1267/walker?tab=readme-ov-file#features
      # providers.prefixes = [];
    };
  };

  programs.elephant = {
    enable = true;

    providers = [
      "bluetooth"
      "bookmarks"
      "calc"
      "clipboard"
      "desktopapplications"
      "files"
      "menus"
      "providerlist"
      "runner"
      "snippets"
      "symbols"
      "todo"
      "unicode"
      "websearch"
      "windows"
      "1password"
    ];
  };
}
