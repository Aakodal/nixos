{
  pkgs,
  ...
}: {
  imports = [
    ./clight.nix
    ./login.nix
    ./printing.nix
    ./xserver.nix
  ];
}
