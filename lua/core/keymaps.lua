local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.gutentags_enabled = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_generate_on_missing = 1

-- Open Tagbar with Ctrl-t
keymap('n', '<C-t>', '<cmd>TagbarToggle<CR>', { noremap = true })

-- Set the tagbar width to 30%
vim.g.tagbar_width = 30

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
-- Enable line numbering
vim.opt.number = true

-- Enable relative line numbering
vim.opt.relativenumber = true
--use space for tabs and whatnot
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars:append("tab:» ")

vim.keymap.set('n', '<leader>h', 'n:nohlsearch<CR>')

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "q", ":q<CR>", opts)
keymap("n", "s", ":w<CR>", opts)
keymap("n", "f", "gg=G", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("v", ">", ">gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


--change yank past default behavuir
keymap("v", "p", '"_dP', opts)
