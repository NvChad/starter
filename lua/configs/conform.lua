local options = {
  formatters_by_ft = {
    lua = { "stylua" },
  },
}

require("conform").setup(options)
