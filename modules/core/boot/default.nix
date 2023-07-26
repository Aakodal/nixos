_: {
  imports = [
    ./loaders
  ];

  config = {
    boot.kernelModules = [ "kvm-intel" ];
  };
}
