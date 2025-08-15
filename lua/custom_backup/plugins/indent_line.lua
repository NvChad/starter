return {
  { -- Add indentation guides even on blank lines
    enabled = false,
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = { enabled = true },
      -- char = '',
      -- context_char = '│',
      -- show_current_context = true,
      -- show_current_context_start = true,
    },
  },
}

-- local highlight = {
--   'CursorColumn',
--   'Whitespace',
-- }
--
-- return {
--   'lukas-reineke/indent-blankline.nvim',
--   config = function()
--     require('ibl').setup {
--       indent = { highlight = highlight, char = '' },
--       whitespace = {
--         highlight = highlight,
--         remove_blankline_trail = false,
--       },
--       scope = { enabled = true },
--     }
--   end,
-- }
--
--
-- -- Define highlight groups for rainbow colors
-- local highlight = {
--   'RainbowRed',
--   'RainbowYellow',
--   'RainbowBlue',
--   'RainbowOrange',
--   'RainbowGreen',
--   'RainbowViolet',
--   'RainbowCyan',
-- }
--
--
-- -- Register the highlight setup hook to apply colors every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
--   vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
--   vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
--   vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
--   vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
--   vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
--   vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
-- end)
--
-- -- Set global rainbow delimiters option
--
-- -- Plugin configuration for `indent-blankline.nvim`
--
-- -- Register scope highlight hooks
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- vim.g.rainbow_delimiters = { highlight = highlight }
--
-- -- Plugin definition for lazy loading or use in plugin manager setup
-- return {
--   'lukas-reineke/indent-blankline.nvim',
--   config = function()
-- 		local hooks = require 'ibl.hooks'
--     require('ibl').setup { scope = { highlight = highlight } }
--   end,
-- }
