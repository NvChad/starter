-- Example custom plugin: Harpoon for quick file navigation
-- Delete this file if you don't want Harpoon

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
    
    -- Navigate to files
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
  end,
}
