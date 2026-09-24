{config, ...}: {
  # grimblast is a screenshot grabber and swappy is a screenshot editor
  # This config provide comprehensive screenshot functionality for hyprland
  home = {
    file = {
      "${config.xdg.configHome}/swappy/config".text = ''
        [Default]
        save_dir=${config.home.homeDirectory}/Pictures/Screenshots
        save_filename_format=screenshot-%Y%m%d-%H%M%S.png
        text_size=50
        text_font=Work Sans Bold
        early_exit=true
      '';
    };
  };
}
