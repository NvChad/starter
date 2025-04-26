return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            -- defaults
            "vim",
            "lua",
            "vimdoc",

            -- web dev
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "json",

            -- other languages
            "python",
            "bash",
            "markdown",
            "markdown_inline",
        },
    },
    config = function(_, opts)
        -- Use the correct module path for treesitter config
        require("custom.configs.treesitter").setup(opts)
    end,
}
