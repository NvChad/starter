return {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "nvim-lspconfig" },
    config = function()
        require("custom.configs.mason-lspconfig")
    end,
}