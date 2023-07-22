{
  self,
  ...
} @ inputs: let 
  inputs = self.inputs;
  outputs = self.outputs;
  mkSystem = inputs.nixpkgs.lib.nixosSystem;

  core = ../modules/core;
  system = ../modules/system;
  virtualization = ../modules/virtualization;

  homes = ../home;

  home-manager = inputs.home-manager.nixosModules.home-manager;

  shared = [core system virtualization homes home-manager];
in {
  # Red laptop
  # Has some problems with GRUB, and no dGPU
  helheim = mkSystem {
    system = "x86_64-linux";
    modules = [
      ./helheim
      { networking.hostName = "helheim"; }
    ] ++ shared;
    specialArgs = { inherit inputs outputs self; };
  };
}
