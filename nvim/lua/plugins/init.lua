return {
    -- Let Lazy manage itself
    { "folke/lazy.nvim" },

    -- Dependencies
    { "nvim-lua/plenary.nvim" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.2.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
    },

    -- Theme
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd.colorscheme("tokyonight-moon")
        end,
    },

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
    },

    -- Misc
    { "mattn/emmet-vim" },
    { "mbbill/undotree" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },

    -- Mason
    { "williamboman/mason.nvim" },

    {
        "williamboman/mason-lspconfig.nvim",
        version = "2.2.0",
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        version = "2.9.0",
    },

    -- Completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
}
