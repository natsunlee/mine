-- Disable netrw to avoid issues/conflicts with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Global whitespace options
vim.opt.list = true
vim.opt.listchars:append({ space = '·' })
--vim.opt.listchars:append('space:·,tab:→ ')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set leader key to ','
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- This additionally makes yanked lines available to paste via
-- cmd/ctrl+V
vim.opt.clipboard = "unnamedplus"

-- LSP diagnostic message configs. Most notably, the `update_in_insert` set to `true` allows for diagnostic messages
-- to remain visible AND update in real-time while in insert mode.
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true,
  })

-- Remaps
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
