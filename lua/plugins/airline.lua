return {
    "vim-airline/vim-airline",
    lazy = false,
    init = function()
        vim.g.airline_theme = "gruvbox"
        vim.g.airline_powerline_fonts = 0
        vim.g.airline_section_b = ""
        vim.g.airline_skip_empty_sections = 1
    end
}
