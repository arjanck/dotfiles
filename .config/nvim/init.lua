vim.o.number = true
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.o.relativenumber = true
vim.opt.spelllang = 'en_us'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.wo.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.relativenumber = true

vim.opt.scrolloff = 5

vim.opt.termguicolors = true

vim.cmd([[autocmd InsertEnter * set norelativenumber]])
vim.cmd([[autocmd InsertLeave * set relativenumber]])

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('v', '<leader>p', '"_dP')

require("plugins")
require("plugin_config")
