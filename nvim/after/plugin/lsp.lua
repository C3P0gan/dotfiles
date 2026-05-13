-- Mason setup
require('mason').setup()

-- mason-lspconfig: automatically install servers and set them up with native config
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'pylsp',
        'jdtls'
    },
    handlers = {
        -- The default handler: create a minimal vim.lsp.config entry and enable the server
        function(server_name)
            -- You can add server-specific settings here later if needed
            vim.lsp.config(server_name, {})
            vim.lsp.enable(server_name)
        end,
    },
})

-- nvim-cmp setup (auto-completion)
local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    }),
})

-- Global LSP keymaps and formatting on attach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Keymaps
        local opts = { buffer = buffnr, remap = false }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

        -- Formatting keymap (if server supports it)
        if client:supports_method('textDocument/implementation') then
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end

        -- Enable LSP completion (NeoVim 0.11 built-in completion can be enabled with this)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
        end
    end,
})

-- (Optional) Format on save – uncomment if you want it
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client:supports_method('textDocument/formatting') then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
--         end,
--       })
--     end
--   end,
-- })
