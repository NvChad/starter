return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      	ensure_installed = {
      		-- Linters
      		"eslint_d",
      		"ruff",
      		-- "mypy",
      		"luacheck",

      		-- Formatters
      		"prettier",
      		"stylua",
      		"black",
      		"isort",
    	}
  	},
	config = function()
		require("mason").setup{
			registries = {
				"github:mason-org/mason-registry"
			}
		}
	end,
}
