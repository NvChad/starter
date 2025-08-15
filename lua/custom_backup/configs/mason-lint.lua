-- Explicitly list linters for Mason to install
require("mason-nvim-lint").setup({
  ensure_installed = {
    "eslint_d",    -- JavaScript/TypeScript
    "ruff",        -- Python
    "luacheck",    -- Lua
    "markdownlint" -- Markdown
    -- Add more linters here as needed
  },
  automatic_installation = false,
})
