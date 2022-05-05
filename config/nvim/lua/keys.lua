local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","

local options = { noremap = true }

map('n', '<SPACE>', ':', options)
map('n', '<C-J>', '<C-W><C-J>', options)
map('n', '<C-K>', '<C-W><C-K>', options)
map('n', '<C-L>', '<C-W><C-L>', options)
map('n', '<C-H>', '<C-W><C-H>', options)

map('n', '<C-r>', '<cmd>lua reload_nvim_conf()<CR>', options)

map('n', '<LEADER><SPACE>', '<cmd>Telescope find_files<CR>', options)

map('n', '<LEADER>1', '<cmd>NvimTreeToggle<cr>', options)
