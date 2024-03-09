return {
  {
    "folke/which-key.nvim",
    keys = {
      "<leader>", '"', "'", "`", "c", "v", "g", "[", "]",
      { "<c-r>", mode = { "c", "i" } },
      { "<c-w>", mode = { "n", "i" } },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      diagnostics = {
        enable = true,
      }
    },
  },

  -- {
  --   'tpope/vim-obsession',
  --   lazy = false,
  -- },

  -- {
  --   'tpope/vim-projectionist',
  --   lazy = false,
  -- },

  {
    'saecki/crates.nvim',
    event = "BufEnter *.toml",
    tag = 'stable',
    -- lazy = false,
    opts = {},
    config = function(_, opts)
      require('crates').setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- config
        "toml",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- low level
        "c",
        "cpp",
        "zig",
        "rust",
        "wgsl",
      },
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   'mg979/vim-visual-multi',
  --   branch = 'master',
  --   lazy = false,
  -- },

  -- {
  --   'rmagatti/auto-session',
  --   lazy = false,
  --   config = function()
  --     require("auto-session").setup {
  --       auto_session_enable_last_session = true,
  --       log_level = "error",
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     }
  --   end
  -- },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        winblend = function()
          return vim.o.winblend
        end,
      }
    },
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = "*",
    lazy = false,
    config = function()
      require("configs.mini-nvim")
    end,
  },

  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group {
        -- default augends used when no group name is specified
        -- TODO: add other augends
        default = {
          augend.constant.alias.bool,    -- boolean value (true <-> false)
          augend.integer.alias.decimal,  -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex,      -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        },
      }
    end
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gd", "<cmd>Gvdiff<CR>", desc = "Git Pull" },
      { "<leader>gs", "<cmd>Git<CR>",    desc = "Git Status" },
    },
  },

  {
    "mhinz/vim-startify",
    lazy = false,
  },

  -- TODO: add yank higilight
}
