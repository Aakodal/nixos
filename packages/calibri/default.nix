{
  stdenv,
  pkgs,
  ...
}: stdenv.mkDerivation {
  pname = "calibri";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "ykis-0-0";
    repo = "fontfamily-calibri";
    rev = "e64835e7a89fd83f829ea288c620edce1b0fe34c";
    hash = "sha256-Cgkkt/djDtExuHMpRkTXid1ofYqa3uXDtlHnj4dk1wQ=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm444 calibri/*.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
