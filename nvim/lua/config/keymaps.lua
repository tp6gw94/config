-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v" }, "gh", "_", { noremap = true })
map({ "n", "v" }, "gl", "$", { noremap = true })
map({ "n" }, "<C-q>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("i", "jk", "<ESC>", { noremap = true })
