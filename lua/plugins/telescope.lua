return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        "%.git/",
                        "node_modules",
                        "vendor/",

                        "%.DS_Store",
                        "%.AppleDouble",
                        "%.LSOverride",
                        "__MACOSX/",

                        "build/",
                        "dist/",
                        "%.o$", "%.a$", "%.out$", "%.dylib$", "%.so$",
                        "%.exe$", "%.dll$",
                        "%.class$", "%.jar$", "%.war$",
                        "%.pyc$", "%.pyo$", "__pycache__",

                        "%.zip$", "%.tar$", "%.tar.gz$", "%.7z$", "%.rar$",

                        "%.jpg$", "%.jpeg$", "%.png$", "%.gif$", "%.bmp$", "%.svg$", "%.ico$",
                        "%.mp3$", "%.mp4$", "%.mkv$", "%.avi$", "%.wav$", "%.flac$",

                        "^[^.]+$",
                    }
                }
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
