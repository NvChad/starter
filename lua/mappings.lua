require "nvchad.mappings"

local map = vim.keymap.set

-- CMake
map("n", "<leader>cg", ":CMakeGenerate<cr>", { desc = "Call CMakeGenerate" })
map("n", "<leader>cb", ":CMakeBuild<cr>", { desc = "Call CMakeBuild" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
