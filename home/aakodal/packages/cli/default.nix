{
  inputs,
  unstable,
  ...
}: {
  imports = [
    ./bat.nix
    ./desktop.nix
    ./macchina
    ./other.nix
    ./wayland.nix
  ];
}
