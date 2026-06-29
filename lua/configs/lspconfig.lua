require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers 
local nv_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Diagnostic signs - using new API instead of deprecated sign_define
-- local signs = {
--   Error = " ",
--   Warn = " ",
--   Hint = " ",
--   Info = " ",
-- }
	-- Diagnostics configuration

-- Enhanced diagnostic configuration with signs
-- vim.diagnostic.config({
-- 		virtual_text = false, -- Keep virtual text enabled
-- 		signs = true, -- Keep signs for errors
-- 		underline = true, -- Enable underlining
-- 		update_in_insert = true,
--   virtual_text = {
--     prefix = "●",
--     source = "if_many",
--     spacing = 4,
--     severity = {
--       min = vim.diagnostic.severity.HINT,
--     },
    -- format = function(diagnostic)
    --   if diagnostic.source == "harper_ls" then
    --     return string.format("[grammar] %s", diagnostic.message)
    --   end
    --   return diagnostic.message
    -- end,
--   },
--   float = {
--     source = true,
--     border = "rounded",
--     header = "",
--     prefix = "",
--     format = function(diagnostic)
--       return string.format("%s: %s", diagnostic.source or "LSP", diagnostic.message)
--     end,
--   },
--   signs = {
--     text = signs,
--     linehl = {},
--     numhl = {},
--   },
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })

-- Signs are now configured via vim.diagnostic.config above

-- Show all diagnostics on cursor hold
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = "rounded",
--       source = "always",
--       prefix = " ",
--       scope = "cursor",
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end,
-- })
--
-- wrap NVChad's on_attach to remove that default <leader>ra binding
local on_attach = function(client, bufnr)
  nv_on_attach(client, bufnr)
  -- vim.keymap.del("n", "<leader>ra", { buffer = bufnr })

  -- Add missing LSP keybindings
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP Go to references" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Go to implementation" })

  -- Enable inlay hints if supported
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- Enable semantic tokens if supported
  if client.supports_method("textDocument/semanticTokens") then
    vim.highlight.priorities.semantic_tokens = 95
  end
end

local marksman_caps = vim.deepcopy(capabilities)
marksman_caps.workspace = vim.tbl_extend("force", marksman_caps.workspace, {
  workspaceFolders = false,
})


-- Define all servers and only specify the bits that differ from the default
local servers = {
  -- simple defaults
  cssls = {},
  eslint = {},
  -- harper_ls = {},
  html = {},
  jsonls = {},

  -- -- Lua
  -- lua_ls = {
  --   settings = {
  --     Lua = {
  --       diagnostics = { enable = false },
  --       workspace = {
  --         library = {
  --           vim.fn.expand "$VIMRUNTIME/lua",
  --           vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
  --           vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
  --           vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
  --         },
  --         maxPreload = 100000,
  --         preloadFileSize = 10000,
  --       },
  --     },
  --   },
  -- },
  --
  -- -- Go (Simplified)
  -- gopls = {
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --     on_attach(client, bufnr)
  --   end,
  --   settings = {
  --     gopls = {
  --       analyses = {
  --         unusedparams = true,
  --       },
  --       staticcheck = true,
  --       gofumpt = true, -- A common and recommended setting
  --     },
  --   },
  -- },
  --
  -- -- Ruby LSP (with Rails & RSpec add-ons)
  -- ruby_lsp = {
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --     require "configs.functions.ruby_deps"(client, bufnr)
  --     on_attach(client, bufnr)
  --   end,
  --   init_options = {
  --     formatter = "standard",
  --     linters = { "standard" },
  --     addonSettings = {
  --       ["Ruby LSP Rails"] = {
  --         enablePendingMigrationsPrompt = false,
  --       },
  --       ["Ruby LSP RSpec"] = {
  --         rspecCommand = "rspec -f d",
  --       },
  --     },
  --   },
  --   cmd = { "mise", "exec", "--", "ruby-lsp" },
  --   settings = {
  --     ruby = {
  --       diagnostics = true,
  --       formatting = true,
  --       lint = true,
  --       completion = true,
  --       ignored_diagnostics = { "Layout/TrailingEmptyLines" },
  --     },
  --   },
  -- },
  --
  -- -- TypeScript / JavaScript (Corrected Name)
  -- ts_ls = {
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --     on_attach(client, bufnr)
  --   end,
  -- },
  --
  -- -- Biome (alternative JS/TS linter & formatter)
  -- biome = {
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --     on_attach(client, bufnr)
  --   end,
  -- },
  --
  -- -- Hypr configuration language
  -- hyprls = {
  --   -- lspconfig defaults are sufficient here
  -- },

  -- Rust (handled by rustaceanvim)

  -- Markdown
  marksman = {
    capabilities = marksman_caps,
    filetypes = { "markdown" },
    single_file_support = true,
  },

  -- ruff = {
  --   cmd = {"ruff", "server"},
  --   filetypes = {"python"},
  --   root_markers = {".git", "pyproject.toml"},
  --   settings = {},
  -- },

  pyright = {
    on_attach = function(client, bufnr)
      client.server_capabilities.publishDiagnosticsProvider = false
      on_attach(client, bufnr)
    end,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic", -- options: off, basic, strict
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      }
    }
  },
  -- Disabled to avoid conflicts with marksman and improve performance
  -- markdown_oxide = {
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --     on_attach(client, bufnr)
  --   end,
  -- },
}

for name, opts in pairs(servers) do
  local server_opts = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }, opts)

  vim.lsp.config(name, server_opts)
end
vim.lsp.enable(vim.tbl_keys(servers))
