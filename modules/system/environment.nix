{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.networking.hostName != "helheim") {
    boot.kernel.sysctl = {
      # Fixes some RAM-related crashes on games (such as Hogwarts Legacy)
      "vm.max_map_count" = 1000000;
    };
  };
}
