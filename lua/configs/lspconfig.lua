require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "ts_ls", "pyright", "clangd", "marksman" }

-- Setup servers with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = require("nvchad.configs.lspconfig").on_attach,
    on_init = require("nvchad.configs.lspconfig").on_init,
    capabilities = require("nvchad.configs.lspconfig").capabilities,
  }
end

-- Python specific config
lspconfig.pyright.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
}

-- C/C++ specific config
lspconfig.clangd.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
