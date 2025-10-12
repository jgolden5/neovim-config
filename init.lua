vim.g.mapleader = " "

require("colors.catpuccin_simplified")
dofile(vim.fn.stdpath("config") .. "/lua/core/keymaps.lua")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.timeout = false --keys requiring additional keys will wait forever until a key combo triggers an event
vim.opt.number = true
