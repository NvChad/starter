local none_ls = require("null-ls")
local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    none_ls.builtins.formatting.gofumpt,
    none_ls.builtins.formatting.goimports_reviser,
    -- none_ls.builtins.formatting.golines,
    none_ls.builtins.diagnostics.mypy,
    none_ls.builtins.formatting.black,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = autogroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = autogroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ buffer = bufnr })
        end,
      })
    end
  end,
}

return opts
