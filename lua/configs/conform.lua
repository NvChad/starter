local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = {"isort", "black"},
    go = {"gofumpt"},
    c = {"clang-format"},
    cpp = {"clang-format"}
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
