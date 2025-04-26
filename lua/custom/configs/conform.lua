local conform = require "conform"

conform.setup {
    formatters_by_ft = {
		lua = { 'stylua' },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		python = { "black", "isort" }, -- Default to "isort" and "black"
        css = { "prettier" },
    	html = { "prettier" },
    	json = { "prettier" },
		-- Use the "*" filetype to run formatters on all filetypes.
    	["*"] = { "codespell" },
    	-- Use the "_" filetype to run formatters on filetypes that don't
    	-- have other formatters configured.
    	["_"] = { "trim_whitespace" },
    },
	-- Set this to change the default values when calling conform.format()
  	-- This will also affect the default values for format_on_save/format_after_save
	default_format_opts = {
    	lsp_format = "fallback",
  	},
	-- Format on save
  	format_on_save = {
  	  -- These options will be passed to conform.format()
	  -- I recommend these options. See :help conform.format for details.
  	  timeout_ms = 500,
  	  lsp_format = "fallback",
  	},
	-- If this is set, Conform will run the formatter asynchronously after save.
  	-- It will pass the table to conform.format().
  	-- This can also be a function that returns the table.
  	format_after_save = {
    	lsp_format = "fallback",
  	},
	-- Conform will notify you when a formatter errors
  	notify_on_error = true,
	-- Conform will notify you when no formatters are available for the buffer
  	notify_no_formatters = true,
	-- Additional formatting options
	formatters = {
	-- Lua
		stylua = {
			prepend_args = {
				"--column-width",
				"88",
				"--line-endings",
				"Unix",
				"--indent-type",
				"Tabs",
				"--indent-width",
				"4",
				"--quote-style",
				"AutoPreferDouble",
			},
		},
		black = {
			prepend_args = {
			"--fast",
			"--line-length",
			"80",
			},
		},
		isort = {
			prepend_args = {
			"--profile",
			"black",
			},
		},
	},
}

-- Autocommand to dynamically select formatters for Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(args)
        local bufnr = args.buf
        if conform.get_formatter_info("ruff_format", bufnr).available then
            conform.formatters_by_ft.python = { "ruff_format" }
        else
            conform.formatters_by_ft.python = { "isort", "black" }
        end
    end,
})

-- BufWritePre autocommand for formatting before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Optional: Set up format-on-save with a key binding
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
end, { desc = "Format file or range (in visual mode)" })

require("conform").setup(options)