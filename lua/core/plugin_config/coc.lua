local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#prev'](1)
        end
        return "<S-Tab>"
end, opts)
vim.keymap.set("i", "<CR>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']();
        end
       return "\r"
end, opts)

-- Remap keys for gotos
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent=true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent=true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent=true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent=true})
