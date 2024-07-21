require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- New Keybindings
map("n", "ZZ", "<cmd> qa <CR>", { desc = "GENERAL Quit nvim" })
map({ "n", "i" }, "<C-z>", ":undo <CR>", { desc = "GENERAL Undo" })
