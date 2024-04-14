-- [[ plug.lua ]]

-- return require('packer').startup(function(use)
require("lazy").setup({
    -- [[ Filesystem navigation ]]
    {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    },

    -- [[ Theme ]]
    { 'Mofiqul/dracula.nvim' },
    { 'morhetz/gruvbox' },
    -- [[ Start screen ]]
    { 'mhinz/vim-startify' },
    -- [[ Cursor jump ]]
    { 'DanilaMihailov/beacon.nvim' },
    -- [[ Statusline ]]
    {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons',
        opt = true}
    },
    -- [[ Language server protocol ]] 
    { 'mfussenegger/nvim-jdtls' },
    { 'neovim/nvim-lspconfig' },
    -- [[ Autocomplete ]]
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    -- [[ Autocomplete icons ]]
    { 'onsails/lspkind.nvim' },
    -- [[ Parensesis autocomplete ]]
    {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    -- [[ Syntax highlighting and analizer ]]
    { 'nvim-treesitter/nvim-treesitter' },
    -- [[ Commenter ]]
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- [[ Image previev, block component]]
    { 'MunifTanjim/nui.nvim'},
    -- [[ File explorer ]]
    { 'nvim-neo-tree/neo-tree.nvim',
        branch='v3.x',
        dependencies={
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        }
    },
    -- [[ Fullscreen toggle ]]
    { 'propet/toggle-fullscreen.nvim'},
    -- [[ Formatter ]]
    { 'mhartington/formatter.nvim'},
})

require('nvim-tree').setup{}
--end)

