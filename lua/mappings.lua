require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- Run mypy on current file
map("n", "<leader>mp", function()
    vim.cmd "!mypy %"
end, { desc = "Run mypy on current file" })

-- DAP (Debugger) keybindings
map(
    "n",
    "<leader>db",
    "<cmd>DapToggleBreakpoint<CR>",
    { desc = "Toggle breakpoint" }
)
map(
    "n",
    "<leader>dc",
    "<cmd>DapContinue<CR>",
    { desc = "Start/Continue debugging" }
)
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step over" })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "Step out" })
map(
    "n",
    "<leader>dt",
    "<cmd>DapTerminate<CR>",
    { desc = "Terminate debugging" }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<D-/>", function()
    require("Comment.api").toggle.linewise.current()
    vim.cmd "normal! j"
end, { desc = "Comment line and move down" })
