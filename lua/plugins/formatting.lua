return {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
        local conform = require("conform")
        local MAX_FILE_SIZE = 1000000

        local function can_format(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return false
            end
            if vim.bo[bufnr].buftype ~= "" or vim.api.nvim_buf_get_name(bufnr) == "" then
                return false
            end
            return #conform.list_formatters(bufnr) > 0 or #conform.list_lsp_formatters(bufnr) > 0
        end

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                swift = { "swiftformat" },
                go = { "gofmt" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            },
            format_on_save = function(bufnr)
                if not can_format(bufnr) then
                    return
                end
                return { async = false, lsp_format = "fallback", timeout_ms = 5000 }
            end,
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4", "--quote-style", "ForceDouble" },
                },
                shfmt = {
                    prepend_args = { "-i", "4", "-ci" },
                },
            },
        })

        vim.api.nvim_create_autocmd("BufReadPost", {
            group = vim.api.nvim_create_augroup("FormatOnOpen", { clear = true }),
            callback = function(args)
                local bufnr = args.buf
                vim.defer_fn(function()
                    if not vim.api.nvim_buf_is_valid(bufnr) or not can_format(bufnr) then
                        return
                    end
                    local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
                    if size < 0 or size > MAX_FILE_SIZE then
                        return
                    end
                    local tick_before = vim.b[bufnr].changedtick
                    conform.format({
                        bufnr = bufnr,
                        async = true,
                        lsp_format = "fallback",
                        timeout_ms = 10000,
                    }, function(err)
                        if err or not vim.api.nvim_buf_is_valid(bufnr) then
                            return
                        end
                        if vim.b[bufnr].changedtick == tick_before and vim.bo[bufnr].modified then
                            vim.bo[bufnr].modified = false
                        end
                    end)
                end, 150)
            end,
        })

        vim.api.nvim_create_user_command("FormatDisable", function()
            vim.g.disable_autoformat = true
        end, { desc = "Disable auto formatting" })
        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.g.disable_autoformat = false
        end, { desc = "Enable auto formatting" })
    end,
}
