return {
    "vim-airline/vim-airline",
    lazy = false,
    init = function()
        vim.g.airline_theme = "gruvbox"
        vim.g.airline_powerline_fonts = 0
        vim.g.airline_section_b = ""
        vim.g.airline_skip_empty_sections = 1
        vim.g.airline_theme_patch_func = "AirlineThemePatch"
        vim.cmd([[
            function! AirlineThemePatch(palette)
                for l:mode in keys(a:palette)
                    if l:mode !~# '^inactive' && has_key(a:palette[l:mode], 'airline_a')
                        let a:palette[l:mode].airline_a[0] = '#282828'
                        let a:palette[l:mode].airline_a[1] = '#a89984'
                    endif
                    if l:mode =~# 'modified$' && has_key(a:palette[l:mode], 'airline_c')
                        let a:palette[l:mode].airline_c[0] = '#ebdbb2'
                    endif
                    for l:section in ['airline_b', 'airline_c', 'airline_x', 'airline_y', 'airline_z']
                        if has_key(a:palette[l:mode], l:section)
                            let a:palette[l:mode][l:section][1] = '#282828'
                        endif
                    endfor
                endfor
            endfunction
        ]])
    end
}
