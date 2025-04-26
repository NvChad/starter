return {
  	"neovim/nvim-lspconfig",
  	event = { "BufReadPre", "BufNewFile" },
  	config = function()
    	-- Load default LSP configs first
    	require "configs.lspconfig"
    	require("nvchad.configs.lspconfig").defaults()

    	-- Then load your custom LSP configs
    	require "custom.configs.lspconfig"
  	end,
}