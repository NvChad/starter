local configs = require("nvchad.configs.lspconfig")

local map = vim.keymap.set

local lspconfig = require "lspconfig"
local servers = {
  -- TODO: make rust_analyzer use clippy for diagnostics
  -- TODO: rust type inlay hints

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  asm_lsp = {
    settings = {
      single_file_support = true,
    }
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { 'W391' },
            maxLineLength = 100
          }
        }
      }
    }
  },
  tsserver = {
    settings = {

    }
  }
}

-- export on_attach & capabilities
-- TODO: this is not set properly for lua because lua lsp is set up in NvChad
configs.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Lsp Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "gi", vim.lsp.buf.implementation, opts "Lsp Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer" ()
  end, opts "Lsp NvRenamer")

  map("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, opts "Workspace symbols")
  map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts "Document symbols")

  map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", require('telescope.builtin').lsp_references, opts "show references")
  -- map("n", "gr", vim.lsp.buf.references, opts "Lsp Show references")

  -- setup signature popup
  if require("nvconfig").ui.lsp.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

for lsp, config in pairs(servers) do
  lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,
  }, config))
end
