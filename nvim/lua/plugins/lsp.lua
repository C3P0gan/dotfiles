-- Helpers
local function capabilities()
    return require("cmp_nvim_lsp").default_capabilities()
end

local function lsp_keymaps(bufnr)
    local opts = {
        buffer = bufnr,
        remap = false,
    }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

local function setup_formatting(client, bufnr)
    if not client:supports_method("textDocument/formatting") then
        return
    end

    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({
            async = true,
        })
    end, {
        buffer = bufnr,
        desc = "Format Buffer",
    })
end

local function setup_completion(client, bufnr)
    if not client:supports_method("textDocument/completion") then
        return
    end

    vim.lsp.completion.enable(
        true,
        client.id,
        bufnr,
        {
            autotrigger = false,
        }
    )
end

-- Language configuration
local function setup_defaults()
    vim.lsp.config("*", {
        capabilities = capabilities(),
    })
end

local function setup_python()
    vim.lsp.config("ruff", {
        init_options = {
            settings = {
                organizeImports = true,
                fixAll = true,
            },
        },
    })

    vim.lsp.config("pylsp", {
        settings = {
            pylsp = {
                plugins = {
                    -- Replaced by Ruff
                    pycodestyle = {
                        enabled = false,
                    },

                    pyflakes = {
                        enabled = false,
                    },

                    mccabe = {
                        enabled = false,
                    },

                    autopep8 = {
                        enabled = false,
                    },

                    yapf = {
                        enabled = false,
                    },

                    flake8 = {
                        enabled = false,
                    },

                    pylint = {
                        enabled = false,
                    },

                    rope = {
                        enabled = true,
                    },

                    rope_completion = {
                        enabled = true,
                    },

                    rope_autoimport = {
                        enabled = true,
                    },

                    rope_rename = {
                        enabled = true,
                    },
                },
            },
        },
    })

    vim.lsp.enable({
        "ruff",
        "pylsp",
        "basedpyright",
    })
end

local function setup_lua()
    vim.lsp.enable("lua_ls")
end

local function on_attach(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    lsp_keymaps(args.buf)
    setup_formatting(client, args.buf)
    setup_completion(client, args.buf)
end

return {
    {
        "neovim/nvim-lspconfig",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            setup_defaults()

            setup_python()
            setup_lua()

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = on_attach,
            })
        end,
    },
}
