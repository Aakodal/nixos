{
  pkgs,
  stdenv,
  ...
}: stdenv.mkDerivation {
  pname = "product-sans";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = "https://raw.githubusercontent.com/egkoppel/product-sans/master/src/zip/Product-Sans-ttf.zip";
    hash = "sha256-YC1EZLHSVxiZTBVZFYE2xk1a/7JLz0RJ4/wnfQ2EcoI=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm444 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
