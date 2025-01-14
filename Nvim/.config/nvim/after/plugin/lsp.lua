-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  remap('n', 'gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
  remap('n', 'gd', vim.lsp.buf.definition, bufopts, "Go to definition")
  remap('n', 'gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
  remap('n', 'K', vim.lsp.buf.hover, bufopts, "Hover text")
  remap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
  remap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  remap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  remap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "List workspace folders")
  remap('n', '<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  remap('n', '<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
  remap('n', '<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
  remap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
end

-- add completion capability
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- python venv info
-- 1. find venv folder in current dir or 1 level deeper (venv/ or proj/venv)
local function find_venv(start_path) -- Finds the venv folder required for LSP
    -- Check current directory (if venv folder is at root)
    local venv_path = start_path .. "/.venv"
    if vim.fn.isdirectory(venv_path) == 1 then
        return venv_path
    end
    -- Check one level deeper (e.g if venv is in proj/venv)
    local handle = vim.loop.fs_scandir(start_path)
    if handle then
        while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then break end
            if type == "directory" then
                venv_path = start_path .. "/" .. name .. "/.venv"
                if vim.fn.isdirectory(venv_path) == 1 then
                    return venv_path
                end
            end
        end
    end

    return nil
end

local lspconfig = require('lspconfig')

lspconfig.basedpyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "basedpyright-langserver", "--stdio" },
  single_file_support = true,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off"
      },
    },
  }
}

-- Note: remove print statements if you dont want it to print whenever the LSP is reloaded due to a venv/ virtual env. I recommend keeping the "Pyright restarted" print message

lspconfig['solargraph'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['clangd'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['ts_ls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}


