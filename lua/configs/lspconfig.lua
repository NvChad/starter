require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end