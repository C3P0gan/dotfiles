local function telescope_builtin(method)
    return function()
        require("telescope.builtin")[method]()
    end
end

return {
    {
        "nvim-telescope/telescope.nvim",

        version = false,
        branch = "master",

        cmd = {
            "Telescope",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            {
                "<leader>pf",
                telescope_builtin("find_files"),
                desc = "Find Files",
            },
            {
                "<C-p>",
                telescope_builtin("git_files"),
                desc = "Find Git Files",
            },
            {
                "<leader>ps",
                telescope_builtin("live_grep"),
                desc = "Live Grep",
            },
            {
                "<leader>vh",
                telescope_builtin("help_tags"),
                desc = "Help Tags",
            },

        },

    },
}
