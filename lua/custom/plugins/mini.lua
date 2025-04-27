local header_art =
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡴⠖⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠲⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠙⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⡆⢀⠀⠀⠀⢤⢾⣱⣜⣾⣧⣶⣶⣶⣿⣷⣷⣶⣦⣤⣄⡀⣼⣞⣆⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⡿⡏⡇⡄⢀⣼⣷⣿⣿⣿⣿⣿⣿⡿⠿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣢⡀⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣰⡇⠀⠀⣤⠻⡽⣼⣿⣿⣿⣿⡿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠷⢦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⠀⠀⠀⣌⢷⣿⣿⡿⠟⢋⡡⠀⠀⢀⣠⣤⣴⣶⣿⣿⣿⣿⣿⣷⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⣈⡙⠶⣤⡀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⠀⠀⢦⣸⠛⠛⢁⡀⣀⣈⢀⣴⣾⣿⣿⣿⠏⣿⢿⣿⣿⣿⡏⠈⢻⣿⠿⣿⣶⣔⢿⣦⣠⣮⣽⠛⠀⠀⠙⢦⠀⠀
⠀⠀⠀⠀⠀⢿⠀⣠⠞⢩⣴⣿⡿⡿⣯⣷⣿⣿⣿⣿⣿⠏⢠⡿⢸⣿⣿⡟⠀⠀⠀⢻⡆⠘⣿⣿⣷⣝⠺⣿⣦⠀⠀⠀⠀⠀⢳⡀
⠀⠀⠀⠀⠀⣨⠟⠁⠐⢷⡹⠋⣰⣿⣿⣿⣿⣿⣿⣿⠏⠀⢸⠃⢸⣿⡟⠀⠀⠀⠀⠸⡇⠀⠘⣿⣿⣿⣷⣄⡁⠀⠀⠀⠀⠀⠈⡇
⠀⠀⠀⣠⠞⠁⠀⠀⠀⠈⢀⣼⣿⣿⣿⣿⠏⢸⣿⠇⠀⠠⠏⠀⢸⠏⠀⠀⠀⠀⠀⠀⠇⠀⠀⢸⣿⣿⣏⠉⡉⡀⠀⠀⠀⠀⣰⡇
⠀⠀⡼⠁⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡟⠀⢸⡟⠀⠀⠀⠀⠘⡏⣀⣿⡒⡿⠀⠀⠀⣀⠀⠀⠈⣿⣿⣿⣧⣿⣿⡆⠀⠀⣠⠏⠀
⠀⣼⠃⠀⢀⣶⣖⡄⠀⣾⣿⣿⣿⣿⣿⠃⠀⢸⣛⣲⣦⣤⣤⣤⣴⡟⠙⣷⣤⣤⠴⠾⠥⣤⡀⠀⣿⣿⡿⠿⣿⣿⠃⢀⡴⠁⠀⠀
⢸⡇⠀⠀⣼⣸⣻⢀⢰⣿⣿⣿⣿⣿⣿⠀⠸⢿⣶⣶⣦⠶⠋⡼⠟⠀⠀⡏⠉⣟⠻⣿⠿⣋⠁⠀⣿⣿⣮⣨⡾⣣⡼⠋⠀⠀⠀⠀
⢸⡇⠀⠀⣿⣿⢸⡻⣸⣿⡟⣭⢿⣿⡽⠄⠀⠀⠀⠀⠀⠀⠀⣠⣶⡀⠀⢻⣲⡦⣉⡋⠙⠏⠀⢸⠋⣞⣹⠗⠋⠁⠀⠀⠀⠀⠀⠀
⠘⣇⠀⠀⢿⣾⣯⣝⠮⢹⣇⠇⣷⡹⣧⠀⠀⠀⠀⢀⡠⠚⠀⠀⠈⠁⠀⠘⠉⠀⠀⠙⢦⠀⠀⢸⣾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠘⣆⠈⡪⠽⣿⣽⠶⠚⠻⣮⣙⠳⢿⡄⠀⠀⠀⠋⠀⠀⢀⣠⠤⠤⠤⠤⢄⣀⠀⠀⠈⠇⠀⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⢶⣍⢻⠒⢺⠾⠩⠽⡇⣈⣙⣶⣷⡀⠀⠀⢀⡤⠚⠉⢀⣤⢴⢶⣤⣄⠉⠙⠲⢤⡀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠋⠉⠉⠉⠉⠉⠀⠀⠀⠈⠻⣦⣀⡉⢀⡠⠞⠉⢠⠏⠘⡄⠻⡍⠲⢦⣤⠷⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡶⣤⣤⣄⣀⣤⣥⣤⣶⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡏⠛⠿⢿⣿⣿⡿⣿⡃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⠇⠀⠀⠀⠉⢻⣿⣿⣣⢿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣴⣶⣿⣿⣯⠀⠀⠀⠀⠀⠀⠘⠛⠋⠈⠋⠙⣿⣷⣦⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

local footer_art = [[
           ░▄▀▀░█▄█░█░█▄░█░▄▀▒
           ░▀▄▄▒█▒█░█░█▒▀█░▀▄█
]]

return { -- Collection of various small independent pluins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- require('mini.sessions').setup {}

    require('mini.pairs').setup {}

    require('mini.files').setup {
      -- TODO: Set preview to true when done with project to not accidentally review important files
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    }
    vim.keymap.set('n', '<C-e>', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true, desc = '[E]xplorer' })

    -- mini.starter dashboard
    -- local starter = require 'mini.starter'
    -- starter.setup {
    --   items = {
    --     starter.sections.recent_files(3, true),
    --   },
    --   content_hooks = {
    --     starter.gen_hook.adding_bullet(),
    --     starter.gen_hook.aligning('center', 'center'),
    --   },
    --   header = header_art,
    --   footer = footer_art,
    -- }

    require('mini.hipatterns').setup {}
    require('mini.icons').setup {}
  end,
}
