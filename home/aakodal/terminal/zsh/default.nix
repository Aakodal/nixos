{ pkgs, unstable, lib, ...}:

{
  #home.packages = [ p10k ];
  programs.zsh = {
    envExtra = "if [[$1 == eval]]; then \"$@\"; set --; fi";
    sessionVariables = { LC_ALL = "en_US.UTF-8"; };
    plugins = [
      {
        name = "powerlevel10k";
        src = "${unstable.zsh-powerlevel10k}/share/zsh-powerlevel10k";
        file = "powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = "${unstable.zsh-powerlevel10k}/share/zsh-powerlevel10k/internal";
        file = "p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [ "powerlevel10k" "powerlevel10k-config" ];
    };
  };
}
