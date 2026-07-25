vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.mapleader = " ";
vim.keymap.set('n', '<leader>j', vim.cmd.Explore, { desc = "open explore" })

require("lspconf")
require("commlspconf")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.treesitter")
require("plugins.rose-pine")
require("plugins.babel")
require("plugins.orgmode")
