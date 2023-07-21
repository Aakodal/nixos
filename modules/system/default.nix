_: {
  imports = [
    ./nix
    ./services
    ./wayland
    ./environment.nix
    ./fonts.nix
    ./locale.nix
 ];

  config.programs.zsh.enable = true;
}
