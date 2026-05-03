let
  userName = "theophiledutrey";
  email = "theophile.dutrey@edu.ece.fr";
in
{
    programs.git = {
        enable = true;
        userName = userName;
        userEmail = email;
    };
}
