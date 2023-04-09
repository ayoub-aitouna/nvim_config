require("mason").setup();

require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" , "clangd"}
})

local on_attach = function(client)
  print('Language server attached!')

  -- Set up key mappings
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- After setting up mason-lspconfig you may set up servers via lspconfig
local lsp_config = require("lspconfig");
lsp_config.lua_ls.setup {
        on_attach = on_attach
}

lsp_config.clangd.setup({
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
  filetypes = {'c', 'cpp', 'objc', 'objcpp'}
})

require("lspconfig").rust_analyzer.setup {}
