-- Helpers
local function parsers()
    return {
        "bash",
        "diff",
        "gitignore",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    }
end

local function treesitter_opts()
    return {
        ensure_installed = parsers(),

        auto_install = true,

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },
    }
end

return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        event = {
            "BufReadPost",
            "BufNewFile",
        },

        opts = treesitter_opts(),

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
