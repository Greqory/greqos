{ stdenv, fetchFromGitHub }:
{
  sddm-catppuccin = stdenv.mkDerivation rec {
    pname = "sddm-catppuccin";
    version = "1.0";
    dontBuild = true;

    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "v${version}";
      sha256 = "";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/catppuccin
    '';
  };
}
