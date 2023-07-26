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
    freerdp
    bc
  ];

  security.polkit.enable = true;

  environment.variables.LIBVIRT_DEFAULT_URI = "qemu:///system";

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
