return {
    "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
    config = function()
        local treesitter_config = require("nvim-treesitter.configs")
        treesitter_config.setup({
            ensure_installed = {"lua", "odin", "swift"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
