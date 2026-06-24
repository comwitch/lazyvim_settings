-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- ~/.config/nvim/lua/config/options.lua

-- line number
vim.opt.number = true

-- search
vim.opt.ignorecase = true

-- tab / indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- wrapping
vim.opt.wrap = false

-- encoding
vim.opt.fileencodings = { "utf-8" }

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1

-- clipboard
-- macOS에서도 보통 unnamedplus가 잘 동작함
vim.opt.clipboard = "unnamedplus"

-- backup / swap directory
vim.opt.backupdir = { "./.backup", ".", "/tmp" }
vim.opt.directory = { ".", "./.backup", "/tmp" }

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
})
-- grep
vim.opt.grepprg = "gitv grep"
