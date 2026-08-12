vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.fn.system( "getplugins.sh" )
        vim.cmd("redraw")
    end,
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.g.mapleader = " ";
vim.keymap.set('n', '<leader>j', '<cmd>Oil<cr>', { desc = "open explore" })

require("lsp_configuration")
require("lsp_defaults")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.treesitter")
require("plugins.rose-pine")
require("plugins.orgmode")
require("plugins.oil")
