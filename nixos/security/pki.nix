{
  inputs,
  pkgs,
  ...
}: let
  # change from DER to PEM
  proxyRootPem = pkgs.runCommand "proxy-root.pem" {} ''
    ${pkgs.openssl}/bin/openssl x509 \
      -in ${inputs.titanium-proxy}/proxy-root.crt \
      -inform DER -outform PEM \
      -out $out
  '';
in {
  security.pki.certificateFiles = [proxyRootPem];
}
