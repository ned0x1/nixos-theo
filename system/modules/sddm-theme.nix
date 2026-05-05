{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-astronaut-theme";

  src = pkgs.fetchFromGitHub {
    owner = "gpskwlkr";
    repo = "sddm-astronaut-theme";
    rev = "468a100460d5feaa701c2215c737b55789cba0fc";
    sha256 = "1h20b7n6a4pbqnrj22y8v5gc01zxs58lck3bipmgkpyp52ip3vig";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/astronaut
    cp -r ./* $out/share/sddm/themes/astronaut/
  '';
}