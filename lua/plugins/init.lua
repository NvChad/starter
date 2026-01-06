return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  
  -- My custom plugins
  {
    "stevearc/aerial.nvim",
    event = "LspAttach", -- 当 LSP 启动时加载
    opts = {
      -- 强制使用树形结构
      layout = {
        max_width = { 40, 0.2 },
        default_direction = "right", -- 在右侧打开，不干扰左侧的 NvimTree
      },
      -- 自动折叠设置
      manage_folds = true,
      -- 实时跟随光标
      highlight_on_hover = true,
    },
  },
  {
    "gitsigns.nvim",
    opts = {
      current_line_blame = true, -- 开启行内提示
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 放在行尾
        delay = 500,           -- 停顿 0.5 秒后显示
      },
    }
  },
  {
  "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true },
      })
    end,
  }
}
