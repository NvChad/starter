require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map for resizing vertical splits
map("n", "<M-Right>", ":vertical resize +1<CR>")
map("n", "<M-Left>", ":vertical resize -1<CR>")

-- map for session manager

map("n", "<leader>fs", function ()
  require('telescope').extensions.possession.list()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
