return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      --
      -- web dev
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "astro",

      -- other langs
      "python",
      "go",
      "java",
      "dart",

      -- template files
      "yaml",
      "gitignore",
    },
  },
}
