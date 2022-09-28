-- uses "gui" :highlight attributes instead of "cterm" attributes.
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
-- vim.opt.cursorline = true

vim.opt.showmode = false
vim.opt.laststatus = 2

vim.opt.scrolloff = 8
vim.opt.history = 1000
vim.opt.updatetime = 300
vim.opt.clipboard = vim.opt.clipboard ^ "unnamed,unnamedplus"
vim.opt.shortmess = vim.opt.shortmess + "c"

-- indentation --
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- search --
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- map , as leader key --
vim.g.mapleader = ","
