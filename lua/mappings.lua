require "nvchad.mappings"
local map = vim.keymap.set

-- Normal Mode
map("n", ";",   ":", {desc = "enter command mode", nowait = true})
map("n", "j",   "j", {desc = "Disable wrapping" })
map("n", "k",   "k", {desc = "Disable wrapping" })

map("n", "<F5>",    ':lua require"dap".continue()<CR>', {desc= "Debug continue", noremap = true, silent = true } )
map("n", "<F17>",   ':lua require"dap".terminate()<CR>', {desc= "Debug Terminate", noremap = true, silent = true } )
map("n", "<C-F17>", ':lua require"dap".restart()<CR>', {desc= "Debug Restart", noremap = true, silent = true } )
map("n", "<F10>",   ':lua require"dap".step_over()<CR>', {desc= "Step Over", noremap = true, silent = true } )
map("n", "<F11>",   ':lua require"dap".step_into()<CR>', {desc= "Step Into", noremap = true, silent = true } )
map("n", "<F12>",   ':lua require"dap".step_out()<CR>', {desc= "Step Out", noremap = true, silent = true } )
map("n", "<F9>",    ':lua require"dap".toggle_breakpoint()<CR>', {desc = "Toggle Breakpoint", noremap = true, silent = true })
map("n", "<leader>dc",  ":lua require'dapui'.toggle()<CR>", {desc = "Debug: Toggle UI" })
map("n", "<leader>ds",  ":lua require'neogen'.generate()<CR>", {desc = "Debug: Test Method" })

map("n", "<leader>tt",  ":lua require'neotest'.run.run()<CR>", {desc = "Neotest: Run test" })
map("n", "<leader>dtm",  ":lua require'neotest'.run.run({strategy = 'dap'})<CR>", {desc = "Neotest: Debug test" })
map("n", "<leader>ts",  ":lua require'neotest'.summary.toggle()<CR>", {desc = "Neotest: Toggle test summary" })
map("n", "<leader>tp",  ":lua require'neotest'.output_panel.toggle()<CR>", {desc = "Neotest: Toggle output panel" })

map("n", "<leader>ac",  ":CopilotChat ", {desc = "CopilotChat - Prompt" })
map("n", "<leader>ae",  ":CopilotChatExplain<CR>", {desc = "CopilotChat - Explain code" })
map("n", "<leader>at",  ":CopilotChatTests<CR>", {desc = "CopilotChat - Generate tests" })
map("n", "<leader>af",  ":CopilotChatFix<CR>", {desc = "CopilotChat - Fix code" })
map("n", "<leader>ar",  ":CopilotChatReview<CR>", {desc = "CopilotChat - Review code" })
map("n", "<leader>aw",  ":CopilotChatToggle<CR>", {desc = "CopilotChat - Toggle Window" })
map("n", "<leader>aq",
  function()
    local input = vim.fn.input "Quick Chat: "
    if input ~= "" then
      require("CopilotChat").ask(input, {
        selection = require("CopilotChat.select").buffer,
      })
    end
  end,
  {desc = "CopilotChat - Quick chat"})

-- Molten/Quarto (Jupyter) - context-aware keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "markdown" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- Use Ctrl-Enter for running cells (works in both Python and Markdown notebooks)
    vim.keymap.set("n", "<C-CR>", function()
      -- Use QuartoSend if available (for markdown), otherwise MoltenEvaluateLine
      local has_quarto = pcall(require, "quarto")
      if has_quarto and vim.bo.filetype == "markdown" then
        require("quarto.runner").run_cell()
      else
        vim.cmd("MoltenEvaluateLine")
      end
    end, {desc = "Run cell", buffer = buf, silent = true})

    vim.keymap.set("v", "<C-CR>", function()
      local has_quarto = pcall(require, "quarto")
      if has_quarto and vim.bo.filetype == "markdown" then
        require("quarto.runner").run_range()
      else
        vim.cmd("MoltenEvaluateVisual")
      end
    end, {desc = "Run selection", buffer = buf, silent = true})

    -- Molten-specific keybindings (use localleader to avoid conflicts)
    vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", {desc = "Initialize kernel", buffer = buf, silent = true})
    vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", {desc = "Evaluate operator", buffer = buf, silent = true})
    vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", {desc = "Re-evaluate cell", buffer = buf, silent = true})
    vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", {desc = "Delete cell", buffer = buf, silent = true})
    vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", {desc = "Hide output", buffer = buf, silent = true})
    vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", {desc = "Open output window", buffer = buf, silent = true})
    vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", {desc = "Execute visual selection", buffer = buf, silent = true})

    -- Quarto navigation (only in markdown)
    if vim.bo.filetype == "markdown" then
      vim.keymap.set("n", "]c", function() require("quarto.runner").run_cell() end, {desc = "Run cell and move next", buffer = buf, silent = true})
      vim.keymap.set("n", "[c", function() require("quarto.runner").run_above() end, {desc = "Run cell above", buffer = buf, silent = true})
    end
  end,
})

-- Visual mode

-- map("v", ">",  ">gv", {desc = "indent" })
-- map("v", "<leader>ac",  ":CopilotChat ", {desc = "CopilotChat - Prompt" })
-- map("v", "<leader>ae",  ":CopilotChatExplain<CR>", {desc = "CopilotChat - Explain code" })
-- map("v", "<leader>at",  ":CopilotChatTests<CR>", {desc = "CopilotChat - Generate tests" })
-- map("v", "<leader>af",  ":CopilotChatFix<CR>", {desc = "CopilotChat - Fix code" })
-- map("v", "<leader>ar",  ":CopilotChatReview<CR>", {desc = "CopilotChat - Review code" })


-- Insert Mode
map("i", ";;",  "<Esc>", {desc = "Enter normal mode", nowait = true } )

map({"i", "n"}, "<C-\\>",
  function()
    require("nvchad.term").toggle {pos = "sp", id="htoggleterm"}
  end,
  {desc = "Toggle horizontal term",}
)

map("i", "<C-,>",  "<C-g>u<Esc>[s1z=`]a<C-g>u", {desc = "Autocorrect spelling" })
map("i", "<C-CR>",
  'copilot#Accept("<CR>")',
  {desc ="Accept Copilot suggestion", silent = true, expr = true, noremap = false, replace_keycodes = false }
)
