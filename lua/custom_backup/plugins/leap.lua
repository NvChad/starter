return {
  'ggandor/leap.nvim',
  config = function()
    require('leap').create_default_mappings()
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-foward-to)', { desc = 'leap-foward-to' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward-to)', { desc = 'leap-backward-to' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'gf', '<Plug>(leap-from-window)', { desc = 'leap-from-window' })
  end,
}
