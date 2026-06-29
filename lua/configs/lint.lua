local M = {}

M.setup = function()
	local lint = require "lint"

	-- local root = vim.fn.getcwd()
	-- local pyproject_path = root .. "/pyproject.toml"
	--
	-- if vim.fn.filereadable(pyproject_path) == 1 then
	-- 	lint.linters.mypy.args = vim.list_extend(
	-- 		lint.linters.mypy.args or {}, 
	-- 		{ "--config-file", pyproject_path }
	-- 	)
	-- else
	-- 	lint.linters.mypy.args = vim.list_extend(
	-- 		lint.linters.mypy.args or {}, 
	-- 		{ "--config-file", "pyproject.toml" }
	-- 	)
	-- end

  lint.linters.mypy = vim.tbl_deep_extend("force", lint.linters.mypy, {
    cmd = "python",
    args = vim.list_extend({ "-m", "mypy" }, lint.linters.mypy.args)
  })

  lint.linters.pylint = vim.tbl_deep_extend("force", lint.linters.pylint, {
    cmd = "python",
    args = vim.list_extend({ "-m", "pylint" }, lint.linters.pylint.args)
  })


	lint.linters_by_ft = {
		python = { "ruff", "mypy", "pylint" },
		cpp = { "cpplint", "cppcheck" },
	}

	local signs = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = false,
		float = {
			source = true,
			border = "rounded",
			header = "",
			prefix = "",
			format = function(diagnostic)
				return string.format("%s: %s", diagnostic.source or "LSP", diagnostic.message)
			end,
		},
		signs = {
			text = signs,
			linehl = {},
			numhl = {},
		},
		severity_sort = true,
	})

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	-- Highlight configurations
	vim.api.nvim_command "highlight DiagnosticUnderlineError gui=underline guisp=#FF0000"
	vim.api.nvim_command "highlight DiagnosticUnderlineWarn gui=underline guisp=#FF9900"
	vim.api.nvim_command "highlight DiagnosticUnderlineInfo gui=underline guisp=#0000FF"
	vim.api.nvim_command "highlight DiagnosticUnderlineHint gui=underline guisp=#00FF00"

	vim.api.nvim_create_autocmd("CursorHold", {
		group = lint_augroup,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				scope = "line",
				border = "single",
			})
		end,
	})
end

return M
