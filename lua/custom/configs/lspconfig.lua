local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Custom LSP servers configuration
local lspconfig = require "lspconfig"

-- list of servers configured with default config.
local default_servers = {
	"pyright",
	"lua_ls",
	"jsonls",
	"html",
	"cssls",
	-- "ruff",
}

-- pyright setup
lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	}
end

-- Example for Rust server
-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     ["rust-analyzer"] = {
--       -- server-specific settings
--     }
--   }
-- }

-- Add more custom LSP servers as needed
