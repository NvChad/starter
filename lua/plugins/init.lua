return {
	-- Formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" }, -- Microsoft's Black formatter
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require "configs.lspconfig"
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- LSP servers
				"lua-language-server",
				"pyright",
				"clangd",
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
				"marksman", -- markdown

				-- Formatters
				"stylua",
				"black", -- Microsoft's Black formatter for Python
				"prettier",
				"clang-format",

				-- Linters
				"flake8",
				"eslint_d",
			},
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"python",
				"c",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Mini.nvim collection
	{
		"echasnovski/mini.nvim",
		config = function()
			-- File explorer (primary)
			require("mini.files").setup {
				windows = {
					preview = true,
					width_focus = 30,
					width_preview = 30,
				},
				mappings = {
					close = "q",
					go_in = "l",
					go_in_plus = "<CR>",
					go_out = "h",
					go_out_plus = "H",
					reset = "<BS>",
					reveal_cwd = "@",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},
			}

			-- Notifications
			require("mini.notify").setup {
				content = {
					format = function(notif)
						return notif.msg
					end,
				},
				window = {
					config = {
						border = "rounded",
					},
					max_width_share = 0.382,
					winblend = 25,
				},
			}
			-- Override vim.notify with mini.notify
			vim.notify = require("mini.notify").make_notify()

			-- Autopairs
			require("mini.pairs").setup {}

			-- Better text objects
			require("mini.ai").setup { n_lines = 500 }
		end,
	},

	-- Better diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
}
