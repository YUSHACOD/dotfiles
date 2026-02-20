vim.opt.scrolloff = 19
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.cmd("set nocompatible")
vim.cmd("syntax on")
vim.cmd("set shortmess+=I")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set textwidth=100")
vim.opt.wrap = true
vim.cmd("set smartindent")
vim.cmd("set linebreak")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.cmd("set clipboard+=unnamedplus")

vim.loader.enable()

vim.o.shell = "cmd"

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) -- Floats (Lazy, Mason, etc.)
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })       -- Popup menus, also seen in completion

vim.o.exrc = true      -- allow local config
vim.o.secure = true   -- restrict unsafe commands

vim.cmd('colorscheme studio98')

