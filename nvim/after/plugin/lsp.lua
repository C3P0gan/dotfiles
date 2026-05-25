-- 1.  Setup Mason
require('mason').setup()

-- 2. Setup nvim-cmp (Completion)
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

-- 3. Prepare LSP capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 4. Apply capabilities for nvim-cmp
vim.lsp.config('*', {
    capabilities = capabilities,
})

-- 5. Setup mason-lspconfig for automatic server enabling
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'pylsp',
        'jdtls',
    },
    -- handlers = {
    --     function(server_name)
    --         vim.lsp.config(server_name, {})
    --         vim.lsp.enable(server_name)
    --     end,
    -- },
})

-- 6. Global LSP keymaps and settings using LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        local opts = { buffer = bfnr, remap = false }
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
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end

        -- Enable built-in auto-completion (optional, can co-exist with nvim-cmp
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
        end
    end,
})
