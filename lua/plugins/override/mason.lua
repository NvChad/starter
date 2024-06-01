return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",

      "html-lsp",
      "css-lsp",
      "eslint_d",
      "prettier",
      "typescript-language-server",

      "pyright",
      "black",
      "flake8",
      "isort",
    },
  },
}
