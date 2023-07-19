{
  inputs,
  unstable,
  ...
}: {
  imports = [
    ./bat.nix
    ./desktop.nix
    ./macchina
    ./wayland.nix
  ];
}