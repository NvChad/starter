require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",

    "html",
    "cssls",
    "tailwindcss",
    "eslint",
    "tsserver",

    "pyright",
  },
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
}
