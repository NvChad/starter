return { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufReadPre" },
    cmd = { "ConformInfo" },
    lazy = false,
    opts = {},
    config = function()
        require("custom.configs.conform")
    end
}