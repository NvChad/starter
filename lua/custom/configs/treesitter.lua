local options = {
  ensure_installed = {
    -- basics
    "bash",
    "vim",
    "lua",
    "vimdoc",
    "powershell",

    -- web development
    "html",
    "css",
    "javascript",
    "typescript",

    -- add more languages as needed
    "python",
    "json",
    "markdown",
    "yaml",
    "toml",
    "c",
    "cpp",
    "java",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },

  -- Optional features you might want
  autotag = { enable = true },
  rainbow = { enable = true },
}

local M = {}

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", options, opts or {})
  require("nvim-treesitter.configs").setup(opts)
end

return M