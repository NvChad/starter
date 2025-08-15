-- autopairs
-- https://github.com/windwp/nvim-autopairs
--

return {
  -- testing mini pairs
  enabled = false,
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method

    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    cmp.config.window.bordered()
    cmp.config.window.bordered()
  end,
}
