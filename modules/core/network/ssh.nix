_: {
  programs.ssh.startAgent = true;

  services.openssh = {
    enable = true;
    startWhenNeeded = true;

    openFirewall = true;
    ports = [30];
  };
}
