{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      nvchad-ui
      nvim-cmp
      nvim-lspconfig
      nvim-colorizer-lua
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
      comment-nvim
      nvim-autopairs
      indent-blankline-nvim
    ];
  };
}
