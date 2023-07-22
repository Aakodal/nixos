{
  config,
  inputs,
  outputs,
  self,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs outputs self;
    };
    users.aakodal = ./aakodal;
  };
}
