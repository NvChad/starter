local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = "fallback",
  },
  -- format_after_save = {
  -- lsp_format = "fallback",
  -- },
  log_level = vim.log.levels.DEBUG,
  notify_on_error = false,
  notify_no_formatters = false,
}

require('conform').setup(options)
