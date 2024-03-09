local configs = require("nvchad.configs.lspconfig")

local lspconfig = require "lspconfig"
local servers = { "rust_analyzer" }

-- TODO: make rust_analyzer use clippy for diagnostics

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,
  }
end
