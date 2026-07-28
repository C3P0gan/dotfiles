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

local function install_parsers()
    local ts = require("nvim-treesitter")

    local installed = ts.get_installed()

    local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
    end, parsers())

    if #missing > 0 then
        ts.install(missing)
    end
end

local function setup()
    local ts = require("nvim-treesitter")

    ts.setup()

    install_parsers()
end

return {
    {
        "nvim-treesitter/nvim-treesitter",

        lazy = false,

        build = function()
            require("nvim-treesitter").update()
        end,

        config = setup,
    },
}
