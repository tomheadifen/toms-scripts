vim.g.mapleader = '\\'
vim.keymap.set("n", "<leader>a", function() print "hi" end)
vim.opt.title = true
vim.opt.titlestring = "NVIM"
vim.opt.number = true
require("config.lazy")
