-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.winblend = 10
opt.number = true -- Show line numbers
opt.cursorline = true -- Highlight the current line

-- Set termguicolors
vim.opt.termguicolors = true

-- Preserve transparency when entering Neovim
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi NonText ctermbg=NONE guibg=NONE")
vim.cmd("hi EndOfBuffer ctermbg=NONE guibg=NONE")
vim.cmd("hi SignColumn ctermbg=NONE guibg=NONE")
