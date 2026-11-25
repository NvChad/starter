local M = {}

-- nvim-treesitter main: installed by plugins/myplugins.lua (indent via indentexpr there).
-- This list replaces NvChad's, so its defaults (luadoc, printf, vimdoc) are repeated.
-- stim is installed separately with :TSInstall stim (registered by its plugin).
M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "luadoc",
    "printf",
    "python",
    "bash",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- latex
    "texlab",
    "tex-fmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
