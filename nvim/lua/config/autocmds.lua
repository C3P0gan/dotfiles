return {
    {
        event = "FileType",

        pattern = {
            "lua",
            "python",
            "bash",
            "json",
            "yaml",
            "toml",
            "markdown",
        },

        callback = function(args)
            pcall(vim.treesitter.start, args.buf)
        end,
    },
}
