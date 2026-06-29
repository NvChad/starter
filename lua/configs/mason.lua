-- lua/configs/mason.lua
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "ruff", 
    "html",
    "cssls",
    "jsonls",
    "marksman",
  },
  automatic_installation = true,
})
