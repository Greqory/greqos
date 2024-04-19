{ stdenv, fetchurl }:
{
  sddm-catppuccin = stdenv.mkDerivation rec {
    name = "sddm-catppuccin";
    src = fetchurl {
      url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip";
      hash = "";
    };

    installPhase = ''
      mkdir -p $out
      cp -aR $src $out/share/sddm/themes/catppuccin-mocha
    '';
  };
}
