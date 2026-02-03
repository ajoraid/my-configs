return {
    "rebelot/kanagawa.nvim",
    config = function()
        vim.cmd("colorscheme kanagawa-dragon")
        vim.cmd([[
            highlight Comment gui=NONE
            highlight Keyword gui=NONE
            highlight Function gui=NONE
            highlight Type gui=NONE
        ]])
    end
}
