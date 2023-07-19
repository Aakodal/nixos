{
  pkgs,
  lib,
  ...
}: {
  boot.binfmt.registrations = lib.genAttrs ["appimage" "AppImage"] (ext: {
    recognitionType = "extension";
    magicOrExtension = ext;
    interpreter = "/run/current-system/sw/bin/appimage-run";
  });

  programs.nix-ld = {
    enable = true;
  };
}
