-- Comment configuration for .stim files
vim.bo.commentstring = "# %s"

-- Enable treesitter syntax highlighting.
-- vim.treesitter.start() bypasses nvim-treesitter's highlight module (which
-- only activates parsers it knew about at startup) and directly starts the
-- built-in highlighter for this buffer.
pcall(vim.treesitter.start)
