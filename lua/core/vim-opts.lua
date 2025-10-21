-- vim settings --
vim.cmd("set expandtab") -- tabs are spaces
vim.cmd("set tabstop=2") -- tabs len 2
vim.cmd("set softtabstop=2") -- ^
vim.cmd("set shiftwidth=2") -- ^

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.number = true
-- create mappings for later --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- diagnostics --
vim.diagnostic.config({ virtual_text = true })
