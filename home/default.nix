{
  config,
  inputs,
  self,
  unstable,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs self unstable;
    };
    users.aakodal = ./aakodal;
  };
}
