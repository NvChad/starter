require "nvchad.mappings"

local map = vim.keymap.set

map("i", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map("i", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })

map("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, { desc = "Increment with dial" })
map("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, { desc = "Decrement with dial" })
map("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, { desc = "Increment with dial" })
map("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, { desc = "Decrement with dial" })
map("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, { desc = "Increment with dial" })
map("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, { desc = "Decrement with dial" })
map("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, { desc = "Increment with dial" })
map("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, { desc = "Decrement with dial" })

map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next annotated comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous annotated comment" })
map("n", ";", "<cmd>", { desc = "Terminal enter command mode" })
map("n", "<leader>fm", function() require("conform").format() end, { desc = "File Format with conform" })

-- map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
