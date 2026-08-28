return {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_contrast_dark = "medium"
        vim.opt.background = "dark"
        vim.cmd("colorscheme gruvbox")
        vim.cmd([[
            highlight StatusLine guifg=#a89984 guibg=#282828 gui=NONE
            highlight StatusLineNC guifg=#3c3836 guibg=#a89984 gui=NONE
        ]])

        local green_functions = { "@function", "@function.call", "@function.method", "@function.method.call", "@function.builtin", "@method", "@method.call" }
        for _, group in ipairs(green_functions) do
            vim.api.nvim_set_hl(0, group, { link = "Function" })
        end

        vim.cmd([[
            highlight! link Keyword GruvboxYellow
            highlight! link Statement GruvboxYellow
            highlight! link Conditional GruvboxYellow
            highlight! link Repeat GruvboxYellow
            highlight! link Exception GruvboxYellow
            highlight! link Label GruvboxYellow
        ]])

        local yellow_keywords = { "@keyword", "@keyword.function", "@keyword.import", "@keyword.conditional", "@keyword.conditional.ternary", "@keyword.repeat", "@keyword.return", "@keyword.exception", "@keyword.modifier", "@keyword.coroutine", "@keyword.directive", "@lsp.type.keyword" }
        for _, group in ipairs(yellow_keywords) do
            vim.api.nvim_set_hl(0, group, { link = "Keyword" })
        end
    end
}
