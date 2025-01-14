-- Autocompletion
return  {
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
}
