vim.cmd("set relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "RRethy/base16-nvim",
    config = function()
      local bg = "#0F1919"
      local accent = "#102121"
      local accent2 = "#0D2525" -- highlight

      local text = "#abb2bf"
      local dark_text = "#3E4451" -- comments, line numbers

      local keyword = "#8F939A"
      local func = "#B6AB8B"
      local types = "#65838E"
      local constant = "#A06057"

      local for_tesing = "#FF0000"

      require("base16-colorscheme").setup({
        base00 = bg,
        base01 = accent,
        base02 = accent2,
        base03 = dark_text,
        base04 = dark_text,
        base05 = text,
        base06 = for_tesing,
        base07 = for_tesing,
        base08 = text,
        base09 = constant,
        base0A = types,
        base0B = constant,
        base0C = text,
        base0D = func,
        base0E = keyword,
        base0F = text,
      })

    end,
  },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

require("lazy").setup(plugins, opt)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 

