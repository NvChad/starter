-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    messages = { view = "mini", view_warn = "mini" },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = false,
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
        max_width = 60,
        max_height = 8,
        border = "rounded",
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    routes = {
      { filter = { event = "notify", find = "No information available" }, opts = { skip = true } },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}
-- return {
--   enabled = false,
--   'folke/noice.nvim',
--   event = { 'BufReadPost', 'BufNewFile' },
--   dependencies = {
--     'MunifTanjim/nui.nvim',
--     {
--       'rcarriga/nvim-notify',
--       name = 'notify',
--       opts = {
--         top_down = false,
--         stages = 'static',
--           -- stylua: ignore
--           max_height = function() return math.floor(vim.o.lines * 0.75) end,
--           -- stylua: ignore
--           max_width = function() return math.floor(vim.o.columns * 0.75) end,
--       },
--     },
--   },
--     -- stylua: ignore
--     init = function() vim.opt.lazyredraw = false end,
--   opts = {
--     messages = { view = 'mini', view_warn = 'mini' },
--     lsp = {
--       override = {
--         ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
--         ['vim.lsp.util.stylize_markdown'] = false,
--         ['cmp.entry.get_documentation'] = false,
--       },
--     },
--     presets = {
--       bottom_search = false,
--       command_palette = false,
--       long_message_to_split = true,
--       inc_rename = true,
--       lsp_doc_border = true,
--     },
--     routes = {
--       { filter = { event = 'notify', find = 'No information available' }, opts = { skip = true } },
--     },
--   },
-- }
