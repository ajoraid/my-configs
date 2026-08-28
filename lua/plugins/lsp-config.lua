return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ols", "clangd", "gopls" },
                automatic_enabled = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.sourcekit.setup({
                capabilities = capabilities
            })
            local show_warnings = false
            local function apply_diagnostics()
                vim.diagnostic.config({
                    virtual_text = show_warnings and true or { severity = vim.diagnostic.severity.ERROR },
                    signs = false,
                    underline = false,
                })
            end
            apply_diagnostics()

            vim.api.nvim_create_user_command("Warnings", function()
                show_warnings = not show_warnings
                apply_diagnostics()
            end, {})
            vim.cmd("cabbrev warnings Warnings")

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<Leader>gb', '<C-o>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>fo', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end
    }
}
