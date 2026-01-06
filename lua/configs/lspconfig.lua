require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "gopls", "typos_lsp" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
