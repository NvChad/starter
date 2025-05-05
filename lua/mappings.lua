require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
