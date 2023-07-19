{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./services
    ./zsh.nix
  ];
}
