return {
  "andweeb/presence.nvim",
  lazy = false,
  config = function()
    require("presence").setup {
      auto_update = true,
    }
  end,
}
