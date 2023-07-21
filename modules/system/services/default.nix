{
  pkgs,
  ...
}: {
  imports = [
    ./clight.nix
    ./login.nix
    ./printing.nix
    ./tumbler.nix
    ./xserver.nix
  ];
}
