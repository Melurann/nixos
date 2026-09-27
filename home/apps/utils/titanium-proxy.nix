{
  inputs,
  pkgs,
  ...
}: let
  proxyPkg = inputs.titanium-proxy.packages.${pkgs.stdenv.hostPlatform.system}.default;

  titaniumProxyCmd = pkgs.writeShellApplication {
    name = "titanium-proxy";
    runtimeInputs = [proxyPkg pkgs.xdg-user-dirs];
    text = ''
      downloads="$(xdg-user-dir DOWNLOAD)"
      config="$downloads/config.seb"

      if [ ! -f "$config" ]; then
        echo "config.seb not found in $downloads" >&2
        exit 1
      fi

      exec titanium-proxy-certificate "$config"
    '';
  };
in {
  xdg.desktopEntries.titanium-proxy = {
    name = "Titanium Proxy Certificate";
    exec = "${titaniumProxyCmd}/bin/titanium-proxy";
    terminal = true;
    categories = ["Utility"];
  };
}
