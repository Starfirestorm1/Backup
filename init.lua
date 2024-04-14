	--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('bootstraps') -- Bootstraps
require('vars')      -- Variables
require('keys')      -- Keymaps
require('plug')      -- Plugins
require('plugSetts') -- Plugins setting 
require('commands')  -- Commands
require('opts')      -- Options


-- PLUGINS
-- Add the block below
