return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

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
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- terraform stuff
        "terraform-ls",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- python stuff
        "pyright",
        "ruff",
        "mypy",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('configs.tabby')
    end,
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event='VeryLazy',
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "vimdoc", "lua",
        "html", "css",
        "javascript", "typescript", "tsx",
        "markdown", "markdown_inline",
      },
    },
  },
  {
    'tmux-plugins/vim-tmux-focus-events',
    event='VeryLazy',
  },
  {
    "tpope/vim-surround",
    event="VeryLazy",
  },
  -- Git wrapper
  {
    "tpope/vim-fugitive",
    event="VeryLazy",
    config = function()
      -- fix issue of missing netrw disabled by telescope.vim
      -- reimplement :Browser command
      vim.api.nvim_create_user_command(
        'Browse',
        function (opts)
          vim.fn.system { 'open', opts.fargs[1] }
        end,
        { nargs = 1 }
      )
    end
  },
  {
    "tpope/vim-rails",
    event="VeryLazy",
  },
  {
    "tpope/vim-endwise",
    event="VeryLazy",
  },
  {
    "tpope/vim-rhubarb",
    event="VeryLazy",
  },
  -- :GBrowse bit bucket
  {
    "tommcdo/vim-fubitive",
    event="VeryLazy",
  },
  {
    "jackMort/ChatGPT.nvim",
    event = 'VeryLazy',
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}
