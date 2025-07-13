vim.cmd("set relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.api.nvim_create_user_command("Odin", function(opts)
  local cmd = "odin run"
  local args = vim.split(opts.args, " ")

  if #args == 1 and args[1] == "-f" then
    local file = vim.fn.expand("%:p")
    cmd = cmd .. " " .. vim.fn.shellescape(file) .. " -file"
  elseif #args == 2 and args[1] == "-p" then
    cmd = cmd .. " " .. vim.fn.shellescape(args[2])
  else
    cmd = cmd .. " ."
  end

  vim.cmd("make! " .. cmd)
end, { nargs = "*" })
vim.opt.makeprg = ""
vim.opt.fillchars = { eob = " " }
vim.opt.textwidth = 80
-- considering the below later..
-- vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
