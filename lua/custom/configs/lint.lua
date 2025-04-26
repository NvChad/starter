-- lint config [Mapping linters for specific file types] --
local lint = require("lint")

-- Define the linters for different file types
lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "ruff" },
  lua = { "luacheck" },
  markdown = { 'markdownlint' },
  -- Add more file types and their linters as needed
}

-- Create a new autogroup for linting
local lint_group = vim.api.nvim_create_augroup("CustomLint", { clear = true })

-- Setup autocommand for running linter after format
vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_group,
  pattern = "*.py",
  callback = function()
    -- Add a larger delay for linting after formatting
    vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(vim.api.nvim_get_current_buf()) then
        require("lint").try_lint()
      end
    end, 200)
  end,
})

-- Configure linters
-- Optionally configure linter options
lint.linters.eslint.args = { "--format", "json", "--quiet" }
lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

-- Set up autocommands to trigger linting
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})