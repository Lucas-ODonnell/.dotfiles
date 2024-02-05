vim.g.mapleader = " "
vim.g.loaded_matchparen=false
vim.g.loaded_matchbracket = false
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
--indentation
vim.opt.list = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
--remove annoying swapfile thing
vim.opt.swapfile = false
vim.opt.backup = false
--highlighting while searching, but don't keep highligting while searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
--clipboard
vim.opt.clipboard = unnamedplus

vim.opt.scrolloff = 8
--clear trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
