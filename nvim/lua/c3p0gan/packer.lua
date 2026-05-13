return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { { 'nvim-lua/plenary.nvim' } }
  } 

  use({
    'folke/tokyonight.nvim', as = 'tokyonight',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end
  })

  use {
    'kdheepak/lazygit.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use {'akinsho/toggleterm.nvim', tag = '*', config = function()
      require('toggleterm').setup()
  end}

  -- LSP, Mason, completion (no lsp-zero)
  use {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.8'   -- pinned to avoid the "framework deprecated" warning
  }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
end)
