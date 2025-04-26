require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", }
vim.lsp.enable(servers)
