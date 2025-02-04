-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true -- Bật màu sắc đẹp hơn

vim.g.lazyvim_eslint_auto_format = true

-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope"

vim.g.lazyvim_php_lsp = "intelephense"

vim.g.blamer_enabled = true
vim.g.NERDTreeShowHidden = 1
vim.o.mouse = "a"
