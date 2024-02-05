local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  "morhetz/gruvbox",
  {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'},
  "nvim-treesitter/playground",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  "jiangmiao/auto-pairs",
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  { "junegunn/fzf", build = "./install --bin" },
  "tpope/vim-fugitive",
  "tpope/vim-dispatch",
  "airblade/vim-gitgutter",
  "mattn/emmet-vim",
  -- LSP Support
  "mfussenegger/nvim-jdtls",
  'neovim/nvim-lspconfig',
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
        {"L3MON4D3/LuaSnip",dependencies = { "rafamadriz/friendly-snippets" },}
      },
    }
  },
})

