{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    virt-manager
    kvmtool
    polkit_gnome
    libsForQt5.polkit-kde-agent
  ];

  security.polkit.enable = true;

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
