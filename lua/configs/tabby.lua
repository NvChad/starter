-- Define custom highlights for Tabby to align with the Tokyo Night theme
vim.api.nvim_exec([[
  highlight CustomTabLineFill guibg=#1a1b26
  highlight CustomTabLine guibg=#24283b guifg=#565f89
  highlight CustomTabLineSel guibg=#3d59a1 guifg=#c0caf5
  highlight CustomTabLineSelBold gui=bold
]], false)

local theme = {
  fill = 'CustomTabLineFill',
  head = 'CustomTabLine',
  current_tab = { fg='#c0caf5', bg='#3d59a1', style='bold' }, -- Adjusted for visibility and emphasis
  tab = 'CustomTabLine',
  win = 'CustomTabLine',
  tail = 'CustomTabLine',
}


require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '󰆣',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
