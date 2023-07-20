{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovim
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs; [
      vimPlugins.nvchad
    ];
  };
}
