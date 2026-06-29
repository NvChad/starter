local neotest = require "neotest"

neotest.setup {
  adapters = {
    require "neotest-python" {
      python = vim.fn.exepath "python",
      root = vim.fn.getcwd(),
      dap = { justMyCode = false },
      args = { "--verbose", "-xvs" },
      runner = "pytest",
      discovery = { enabled = true },
    },
  },
}

return neotest
