return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      'isakbm/gitgraph.nvim',
    },
    config = true,
    keys = {
      { '<leader>tn', ':Neogit<CR>', desc = '[T]oggle [N]eogit' },
      -- TODO: should prob move this to telescope file
      { '<leader>sB', ':Telescope git_branches<CR>', desc = '[S]earch [B]ranches' },
    },
    opts = {
      graph_style = 'kitty',
      integrations = {
        diffview = true,
      },
    },
  },
  {
    'isakbm/gitgraph.nvim',
    dependencies = {
      'sindrets/diffview.nvim',
    },
    opts = {
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
          vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
          vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
        end,
      },

      symbols = {
        merge_commit = '',
        commit = '',
        merge_commit_end = '',
        commit_end = '',

        -- Advanced symbols
        GVER = '',
        GHOR = '',
        GCLD = '',
        GCRD = '╭',
        GCLU = '',
        GCRU = '',
        GLRU = '',
        GLRD = '',
        GLUD = '',
        GRUD = '',
        GFORKU = '',
        GFORKD = '',
        GRUDCD = '',
        GRUDCU = '',
        GLUDCD = '',
        GLUDCU = '',
        GLRDCL = '',
        GLRDCR = '',
        GLRUCL = '',
        GLRUCR = '',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        '<leader>gl',
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = 'GitGraph - Draw',
      },
    },
  },
  -- { starting to like neogit more
  --   'tpope/vim-fugitive',
  --   config = true,
  --   enabled = false,
  --   opts = {},
  --   keys = {
  --     { '<leader>tf', ':tab G<CR>', desc = '[T]oggle [f]ugitive' },
  --     { '<leader>tB', ':Git branch<CR>', desc = '[T]oggle [B]ranch' },
  --   },
  -- },
  -- {
  --   'sindrets/diffview.nvim',
  -- },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Hunk [S]tage' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Hunk [R]eset' })
        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo staged hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = '[B]lame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = '[g]it [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
