--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
-- [[ Input mode keys ]]
-- [[ Remap the key used to leave insert mode ]]
map('i', 'jj', '<Esc>', {})
-- [[ Terminal keys ]] 
map('t', '<Esc>', '<C-\\><C-n>', {})
map('t', 'jj', '<C-\\><C-n>', {})
-- [[ Normal mode key ]]
-- [[ Tab switch ]]
map('n', '<C-h><C-h>', [[:-tabnext<CR>]], {})
map('n', '<C-l><C-l>', [[:+tabnext<CR>]], {}) -- [[ Subwindow switch ]]
map('n', '<C-h>', '<C-w><C-h>', {})
map('n', '<C-j>', '<C-w><C-j>', {})
map('n', '<C-k>', '<C-w><C-k>', {})
map('n', '<C-l>', '<C-w><C-l>', {})
-- [[ Move cursor to begin/end of line ]]
map('n', 'H', '^', {})
map('n', 'L', '$', {})
-- [[ Fullscreen toggle ]]
map('n', 'F', ":lua require('toggle-fullscreen'):toggle_fullscreen()<CR>", {})
-- [[ Visual mode keys ]]
map('v', 'i', '<Esc>i', {})
-- [[ Toggle nvim-tree ]] 
map('n', '<C-n>', [[:Neotree toggle<CR>]], {})
-- [[ Command mode keys ]]
-- [[ Use J/K as arrow down/arrow up to select previous command]]
map('c', '<C-j>', '<Down>', {})
map('c', '<C-k>', '<Up>', {})
