return {
    {
        "mattn/emmet-vim",
        ft = {
            "html",
            "css",
            "javascript",
            "typescript",
            "vue",
        },
    },

    {
        "tpope/vim-repeat",
        lazy = false,
    },

    {
        "tpope/vim-surround",
        dependencies = {
            "tpope/vim-repeat",
        },
        lazy = false,
    },
}
