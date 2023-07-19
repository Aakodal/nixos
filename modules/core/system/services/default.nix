{
  pkgs,
  ...
}: {
  imports = [
    ./login.nix
    ./printing.nix
    ./redshift.nix
    ./xserver.nix
  ];
}
