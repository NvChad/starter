return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon').setup()
  end,
  keys = {
    {
      '<leader>H',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon file',
    },
    {
      '<leader>h',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[h]arpoon quick menu',
    },

    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = nil,
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
    },
    {
      '<leader>5',
      function()
        require('harpoon'):list():select(5)
      end,
    },
  },
}
