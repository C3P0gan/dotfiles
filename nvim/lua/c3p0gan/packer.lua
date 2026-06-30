return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim', version = '0.2.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    })

    use {
        'kdheepak/lazygit.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('mattn/emmet-vim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use { 'akinsho/toggleterm.nvim', tag = '*', config = function()
        require('toggleterm').setup()
    end }

    -- LSP, Mason, completion
    use {
        'neovim/nvim-lspconfig',
        tag = 'v2.9.0'
    }

    use {
        'williamboman/mason-lspconfig.nvim',
        tag = 'v2.2.0'
    }

    use 'williamboman/mason.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
end)
