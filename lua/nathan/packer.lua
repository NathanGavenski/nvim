-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { "nvim-lua/plenary.nvim" }

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

 use {
     "ThePrimeagen/harpoon",
     branch = "harpoon2",
     requires = { {"nvim-lua/plenary.nvim"} }
 }

 use({ "catppuccin/nvim", as = "catppuccin" })

 use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
 use('nvim-treesitter/playground')
 use('mbbill/undotree')

 use('tpope/vim-fugitive')

 use('lervag/vimtex')

 use("m4xshen/smartcolumn.nvim")

 use {
     'VonHeikemen/lsp-zero.nvim',
     requires = {
	--LSP Support
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

        --Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        --Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
 }

 use {
     'nvim-tree/nvim-tree.lua',
     requires = {
         'nvim-tree/nvim-web-devicons', -- optional
     },
 }

 use({
   "Pocco81/auto-save.nvim",
   config = function()
    require("auto-save").setup {
        enabled = true,
        execution_message = {
            message = function() 
                return ("File saved at " .. vim.fn.strftime("%H:%M:%S"))
            end,
            clearning_interval = 1250,
        },
        trigger_events = {"InsertLeave", "TextChanged"},
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")
		if
		    fn.getbufvar(buf, "&modifiable") == 1 and
		    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
		    return true
		end
                return false
            end,
        write_all_buffers = true,
        debounce_delay = 125,
            callbacks = {
            enabling = nil,
            disabling = nil,
            before_asserting_save = nil,
            before_saving = nil,
            after_saving = nil
        }
    }
   end,
 })

 use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

end)

