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
        "gopls",
        "black",
      },
      indent = {enable = true},
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        disabled = {"csv"},
      },
      textobjects = {select = {enable = true, lookahead = true}}

    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
      {
        "nvim-treesitter/nvim-treesitter-context", -- Show code context
        opts = {
          enable = true,
          mode = "topline",
          line_numbers = true,
        },
      },
    },
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
        "go",
      },
    },
  },

  -- lightspeed.nvim
  {
    "ggandor/lightspeed.nvim",
    event = "VimEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
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
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    opts = {
      enable_chat = true,
    },
    config = function()
      require "configs.codeium"
      -- vim.keymap.set("i", "<C-g>", function()
      --   return vim.fn["codeium#Accept"]()
      -- end, { expr = true, silent = true })
      -- vim.keymap.set("i", "<C-;>", function()
      --   return vim.fn["codeium#CycleCompletions"](1)
      -- end, { expr = true, silent = true })
      -- vim.keymap.set("i", "<C-,>", function()
      --   return vim.fn["codeium#CycleCompletions"](-1)
      -- end, { expr = true, silent = true })
      -- vim.keymap.set("i", "<C-x>", function()
      --   return vim.fn["codeium#Clear"]()
      -- end, { expr = true, silent = true })
    end,
  },
}
