local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
  
    -- Pyright setup
    lspconfig.pyright.setup{}

    -- Null-ls setup for Black, Ruff, MyPy
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,   -- Black
            null_ls.builtins.diagnostics.ruff,   -- Ruff
            null_ls.builtins.diagnostics.mypy,   -- MyPy
        },
    })
end

 -- Format on save using Black
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
            vim.lsp.buf.format({async = false})
        end,
    })

local dap = require('dap')

-- Set key mappings for debugging
return M
