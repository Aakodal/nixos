{
  pkgs,
  ...
}: {
  imports = [
    ./network
    ./system
    ./user.nix
  ];
}