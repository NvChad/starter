return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "cpp", "c", "cmake",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            -- Load NvChad's default Telescope config
            local config = require("nvchad.configs.telescope")

            config.defaults.file_ignore_patterns = {
                "node_modules",
                "build",
                "%.vscode",
                "%.git",
                "%.cache",
                "%.idea",
            }

            return config
        end,
    },
}
