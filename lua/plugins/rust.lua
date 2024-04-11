return {
 {
   'mrcjkb/rustaceanvim',
   version = '^4', -- Recommended
   ft = { 'rust' },
   -- dependencies = {
   --  "nvim-lua/plenary.nvim",
   --  "mfussenegger/nvim-dap",
   --  {
   --    "lvimuser/lsp-inlayhints.nvim",
   --    opts = {}
   --  },
   -- },
   opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cr", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
          vim.keymap.set("n", "<leader>cm", function ()
            vim.cmd.RustLsp("expandMacro")
          end, { desc = "Expand Macros Recursively", buffer = bufnr})
          vim.keymap.set("n", "<leader>ce", function ()
            vim.cmd.RustLsp("explainError")
          end, { desc = "Expand Error", buffer = bufnr})
          vim.keymap.set("n", "<leader>cd", function ()
            vim.cmd.RustLsp("renderDiagnostic")
          end, { desc = "Render Diagnostics", buffer = bufnr})
          vim.lsp.inlay_hint.enable(bufnr, true)

        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
 },

 {
  "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  }
}
