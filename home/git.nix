{
  pkgs,
  config,
  ...
}: {
programs.git = {
    enable = true;
    userName = "melurann";
    userEmail = "fruroa21@htl-kaindorf.at";
    ignores = ["*~" ".DS_Store" ".direnv"];
    extraConfig = {
        pull = {
            rebase = true;
        };
        credential.helper = "!gh auth git-credential";
    };
  };
}