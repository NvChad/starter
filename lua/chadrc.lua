vim.opt.relativenumber = true;

-- neovide settings
if vim.g.neovide then
  vim.o.guifont = "FiraMono Nerd Font:h10";
  vim.o.winblend = 30;

  -- vim.g.neovide_transparency = 1.0
  -- vim.g.transparency = 0.0
  -- vim.opts.defaults.winblend

  vim.g.neovide_scroll_animation_length = 0.1;
  vim.g.neovide_remember_window_size = true;

  vim.g.neovide_profiler = false;
  vim.g.neovide_cursor_animation_length = 0.03;
  vim.g.neovide_cursor_trail_size = 0.03;
  vim.g.neovide_cursor_animate_command_line = true;

  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.neovide_floating_blur_amount_y = 4.0

  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" });
  vim.cmd([[
    set winblend=30
    set pumblend=30

    " hi PmenuSel blend=0
    " hi TelescopeNormal blend=0

    " autocmd FileType * setlocal winblend=30
    " augroup floating_windows
    "   autocmd!
    "   autocmd WinEnter,WinNew * if vim.api.nvim_win_get_config(0).relative ~= '' then vim.api.nvim_win_set_option(0, 'winblend', 30) end
    " augroup END
    " au WinEnter,WinNew * if &float | setlocal winblend=30 | endif
  ]])
end

-- TODO: set up misspelling detection
-- TODO: set up highlight hovering word

return {
  ui = {
    theme = 'onedark',
    hl_override = {
      Todo = {
        link = "Comment"
      },
      Identifier = {},
      -- TODO: add semtoken colors
      -- TODO: disable color highlighter's false positives (e.g. black_box should not be highlighted)
    },
    lsp_semantic_tokens = true,
    telescope = { style = "bordered" },
    statusline = {
      separator_style = "round",
    }
  },
}
