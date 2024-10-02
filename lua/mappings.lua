require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<C-l>",
  function()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
  end,
  {
    desc = "Copilot Accept",
    replace_keycodes = true,
    nowait = true,
    silent = true,
    expr = true,
    noremap = true
  }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--   }
-- )

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--   }
-- )

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
