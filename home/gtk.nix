_: {
  gtk = {
    enable = true;

    gtk3 = {
      # <https://docs.gtk.org/gtk3/class.Settings.html#properties>
      extraConfig = {
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };

    gtk4 = {
      # <https://docs.gtk.org/gtk4/class.Settings.html#properties>
      extraConfig = {
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };
  };
}
