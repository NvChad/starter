require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  html = {},
  cssls = {},
  rust_analyzer = {
    filetypes = { "rust" },
    root_dir = util.root_pattern "Cargo.toml",
    settings = {
      cargo = { allFeatures = true },
    },
  },
}

for name, opts in pairs(servers) do
  lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = opts.filetypes,
    root_dir = opts.root_dir,
    settings = opts.settings,
  }
end
-- read :h vim.lsp.config for changing options of lsp servers
