return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "clangd",
        "rust-analyzer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "c",
        "cpp",
        "rust",
      },
    },
  },

  -- lightspeed.nvim
  {
    "ggandor/lightspeed.nvim",
    event = "VimEnter",
  },
  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = "å*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust"},
    lazy = false, -- This plugin is already lazy
    -- config = function(_, _)
    --   vim.g.rustaceanvim = {
    --     server = {
    --       on_attach = function(client, buffer)
    --         require("core.utils").load_mappings("lspconfig", { buffer = buffer })
    --         require("nvchad.signature").setup(client)
    --       end,
    --     },
    --   }
    -- end,
  },
}
