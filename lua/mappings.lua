local map = vim.keymap.set

-- Basic mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Cursor movement in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })

-- Line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- File explorers
-- Primary: mini.files (Ctrl+e)
map("n", "<C-e>", function()
  require('mini.files').open()
end, { desc = "open mini.files (primary)" })

-- Secondary: nvim-tree (Ctrl+b, changed from original Ctrl+n)
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle (secondary)" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus" })

-- Formatting
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format file" })

-- Buffer management
map("n", "<C-t>", "<cmd>enew<CR>", { desc = "new buffer" })
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "next buffer" })
map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "prev buffer" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })

-- Comments
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "find all files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "git status" })

-- Theme
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "escape terminal mode" })
map("n", "<leader>i", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "new horizontal term" })
map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "new vertical term" })

-- Toggleable terminals
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "toggle vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "toggle horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "toggle floating term" })

-- System clipboard
map("v", "<C-c>", '"+y', { noremap = true, silent = true, desc = "copy to clipboard" })
map("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "paste from clipboard" })
map("i", "<C-v>", '<C-o>"+p', { noremap = true, silent = true, desc = "paste from clipboard" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Markdown preview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "markdown preview toggle" })

-- Cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
