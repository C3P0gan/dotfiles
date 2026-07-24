return {
    {
        "hrsh7th/nvim-cmp",

        event = "InsertEnter",

        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
        },

        opts = function()
            local cmp = require("cmp")

            return {
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-n>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-y>"] = cmp.mapping.confirm({
                        select = true,
                    }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            }
        end,

        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
}
