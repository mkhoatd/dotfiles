-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
vim.o.hlsearch = false

vim.o.mouse = "a"

vim.o.undofile = true

vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 4
-- vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
-- vim.o.noexpandtab = true

vim.o.smartindent = true
vim.o.autoindent = true

vim.o.wrap = false

vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
-- vim.o.signcolumn = "yes"
-- vim.o.colorcolumn = "80"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.opt.clipboard:append({ "unnamedplus" })
vim.o.encoding = "utf-8"
vim.opt.background = "dark" -- set this to dark or light
