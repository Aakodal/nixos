{
  self,
  ...
} @ inputs: let 
  inputs = self.inputs;
  mkSystem = inputs.nixpkgs.lib.nixosSystem;

  boot = ../modules/boot;
  core = ../modules/core;
  system = ../modules/system;
  virtualization = ../modules/virtualization;

  homes = ../home;

  home-manager = inputs.home-manager.nixosModules.home-manager;

  shared = [boot core system virtualization homes home-manager];
in {
  # Red laptop
  # Has some problems with GRUB, and no dGPU
  redGiant = mkSystem {
    system = "x86_64-linux";
    modules = [
      ./redGiant
      { networking.hostName = "red-giant"; }
    ] ++ shared;
    specialArgs = { inherit inputs self; };
  };
}
