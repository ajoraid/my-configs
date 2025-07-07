return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                hijack_netrw_behavior = "disabled",
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_hidden = true,
                    never_show = {
                        ".DS_Store"
                    },
                    show_hidden_count = false
                }
            },
        })

        vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        vim.keymap.set("n", "<leader>e", ":Neotree focus <CR>", {})
    end,
}
