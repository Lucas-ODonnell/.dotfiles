return {
  "morhetz/gruvbox",
  {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'},
  "nvim-treesitter/playground",
  "jiangmiao/auto-pairs",

  { "junegunn/fzf", build = "./install --bin" },
  --copilot
  "github/copilot.vim",
  "tpope/vim-fugitive",
  "tpope/vim-dispatch",
  "airblade/vim-gitgutter",
  "mattn/emmet-vim",
  -- LSP Support
  "mfussenegger/nvim-jdtls",
  'neovim/nvim-lspconfig',
}
