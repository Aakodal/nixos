{
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    
    initExtra = ''
      if [[ $1 == "eval" ]]; then
        "$@"
        set --
      fi

      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' list-colors "$\{(s.:.)LS_COLORS\}"
      zstyle ':completion:*' rehash true
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path ~/.zsh/cache

      while read -r option; do
        setopt $option
      done <<-EOF
      CORRECT
      HIST_FCNTL_LOCK
      HIST_IGNORE_DUPS
      HIST_IGNORE_SPACE
      SHARE_HISTORY
      EOF

      while read -r option; do
        unsetopt $option
      done <<-EOF
      HIST_EXPIRE_DUPS_FIRST
      EXTENDED_HISTORY
      EOF
    '';

    sessionVariables = { LC_ALL = "en_US.UTF-8"; };
    plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config; 
        file = "p10k.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
