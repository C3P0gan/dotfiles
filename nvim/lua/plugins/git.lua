return {
    {
        "tpope/vim-fugitive",

        cmd = {
            "Git",
            "G",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
        },
    },

    {
        "kdheepak/lazygit.nvim",

        cmd = {
            "LazyGit",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            {
                "<leader>gg",
                function()
                    vim.cmd("LazyGit")
                end,
                desc = "Open LazyGit",
            },
        },
    },
}
