local function get_harpoon()
    return require("harpoon")
end

local function harpoon_list()
    return get_harpoon():list()
end

local function select_file(index)
    return function()
        harpoon_list():select(index)
    end
end

return {
    {
        "ThePrimeagen/harpoon",

        branch = "harpoon2",

        dependencies = {
            "nvim-lus/plenary.nvim",
        },

        keys = {
            {
                "<leader>a",
                function()
                    harpoon_list():add()
                end,
                desc = "Harpoon Add File",
            },
            {
                "<C-e>",
                function()
                    get_harpoon().ui:toggle_quick_menu(harpoon_list())
                end,
                desc = "Harpoon Quick Menu",
            },
            {
                "<C-h>",
                select_file(1),
                desc = "Harpoon File 1",
            },
            {
                "<C-t>",
                select_file(2),
                desc = "Harpoon File 2",
            },
            {
                "<C-n>",
                select_file(3),
                desc = "Harpoon File 3",
            },
            {
                "<C-s>",
                select_file(4),
                desc = "Harpoon File 4",
            },
        },

        opts = {},

        config = function(_, opts)
            get_harpoon():setup(opts)
        end,
    },
}
