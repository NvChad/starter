require "nvchad.mappings"

local map = vim.keymap.set

------------- QOL -------------
-- map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map("i", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })
map("n", ";", "<cmd>", { desc = "Terminal enter command mode" })
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })
map("n", "<leader>cs", "<cmd>Telescope session-lens<cr>", { desc = "Change session telescope" })
-- TODO: Add mapping for toggling comment in insert mode.
-- TODO: Make completion menu open whenever you enter insert mode.
-- TODO: Map _ to go to start of line or the first part of comment (after the colon if a TODO comment).

-- map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "Buffer Goto next" })
-- map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "Buffer Goto prev" })
map("n", "<C-tab>", "<cmd>bprev<cr>", { desc = "Buffer Goto prev active" })
map("n", "<C-S-tab>", "<cmd>bnext<cr>", { desc = "Buffer Goto next active" })

------------- CompetiTest -------------
map("n", "<leader>cpu", "<CMD>CompetiTest show_ui<CR>", { desc = "CompetiTest show ui" })
map("n", "<leader>cpr", "<CMD>CompetiTest run<CR>", { desc = "CompetiTest run" })
map("n", "<leader>cpR", "<CMD>CompetiTest run_no_compile<CR>", { desc = "CompetiTest run without compiling" })
map("n", "<leader>cpa", "<CMD>CompetiTest add_testcase<CR>", { desc = "CompetiTest add testcase" })
map("n", "<leader>cpe", "<CMD>CompetiTest edit_testcase<CR>", { desc = "CompetiTest edit testcase" })

------------- todo-comments -------------
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next annotated comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous annotated comment" })
map(
  "n",
  "<leader>td",
  "<CMD>TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE,TODO,PERF,OPTIM,PERFORMANCE,OPTIMIZE<CR>",
  { desc = "Open TODO telescope menu" }
)

------------- crates.io -------------
map("n", "<leader>ct", function() require("crates").toggle() end, { desc = "Toggle crates" })
map("n", "<leader>cr", function() require("crates").reload() end, { desc = "Reload crates" })

map("n", "<leader>cv", function() require("crates").show_versions_popup() end, { desc = "Show crate versions" })
map("n", "<leader>cf", function() require("crates").show_features_popup() end, { desc = "Show crate features" })
map("n", "<leader>cd", function() require("crates").show_dependencies_popup() end, { desc = "Show crate dependencies" })

map("n", "<leader>ce", function() require("crates").expand_plain_crate_to_inline_table() end,
  { desc = "Convert inline crate to inline table" })

map("n", "<leader>cE", function() require("crates").extract_crate_into_table() end, { desc = "Refactor crate to table" })

map("n", "<leader>cu", function() require("crates").update_crate() end, { desc = "Update crate" })
map("v", "<leader>cu", function() require("crates").update_crates() end, { desc = "Update crates" })
map("n", "<leader>ca", function() require("crates").update_all_crates() end, { desc = "Update all crates" })
map("n", "<leader>cU", function() require("crates").upgrade_crate() end, { desc = "Upgrade crate" })
map("v", "<leader>cU", function() require("crates").upgrade_crates() end, { desc = "Upgrade crates" })
map("n", "<leader>cA", function() require("crates").upgrade_all_crates() end, { desc = "Upgrade all crates" })

map("n", "<leader>cH", function() require("crates").open_homepage() end, { desc = "Open crate open homepage" })
map("n", "<leader>cR", function() require("crates").open_repository() end, { desc = "Open crate repository" })
map("n", "<leader>cD", function() require("crates").open_documentation() end, { desc = "Open crate documentation" })
map("n", "<leader>cC", function() require("crates").open_crates_io() end, { desc = "Open crates.io" })

------------- dial -------------
map("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end, { desc = "Increment with dial" })
map("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end, { desc = "Decrement with dial" })
map("n", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gnormal")
end, { desc = "Increment with dial" })
map("n", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gnormal")
end, { desc = "Decrement with dial" })
map("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end, { desc = "Increment with dial" })
map("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end, { desc = "Decrement with dial" })
map("v", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gvisual")
end, { desc = "Increment with dial" })
map("v", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gvisual")
end, { desc = "Decrement with dial" })
