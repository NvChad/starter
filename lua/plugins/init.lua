return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  { require "plugins.override.nvim-lspconfig" },
  { require "plugins.override.mason" },
  { require "plugins.override.treesitter" },
  { require "plugins.reinforcement.copilot" },
  { require "plugins.reinforcement.vim-wakatime" },
  { require "plugins.reinforcement.noice" },
  { require "plugins.reinforcement.markdown-preview" },
  { require "plugins.reinforcement.mason-lspconfig" },
}
