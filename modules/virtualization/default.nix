{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [ virt-manager ];

  virtualisation =  {
    kvmgt.enable = true;
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
        swtpm.enable = true;
        package = pkgs.qemu_kvm;
      };
    };
  };
}
