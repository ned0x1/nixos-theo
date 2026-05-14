let
  userName = "theophiledutrey";
  email = "theophile.dutrey@edu.ece.fr";
in
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = userName;
        email = email;
      };
    };
  };
}
