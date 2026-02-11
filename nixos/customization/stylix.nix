{
  lib,
  meta,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = meta.theme.scheme;
    polarity = lib.mkDefault (meta.theme.polarity or "dark");

    fonts = lib.mkMerge [
      {
        sizes = {
          applications = 11;
          terminal = 11;
          desktop = 11;
          popups = 11;
        };
      }
      (meta.theme.fonts or {})
    ];

    cursor = meta.theme.cursor or {};
  };
}
