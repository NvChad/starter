local overrides = require "configs.overrides"
local cmp = require "cmp"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("configs.lint").setup()
		end,
	},
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "nvimtools/none-ls.nvim",
    -- event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local none_ls = require("none-ls")
      none_ls.setup(require("configs.none-ls"))
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- main branch: a rewrite for nvim 0.12 that only installs parsers/queries and
    -- provides indentexpr. Highlighting is started by NvChad's FileType autocmd
    -- (vim.treesitter.start). Does not support lazy-loading.
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = overrides.treesitter,
    config = function(_, opts)
      local ts = require "nvim-treesitter"
      ts.setup()
      ts.install(opts.ensure_installed) -- async; skips parsers already installed
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterIndent", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and vim.treesitter.query.get(lang, "indents") then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"
      conf.mapping["<CR>"] = cmp.mapping {
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm { select = true },
        c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      }
      -- LuaSnip only drops the innermost deleted snippet, leaving a deleted outer
      -- snippet (e.g. "//" inside "mk") active; keep dropping until the active one is intact
      local function drop_deleted_snippets()
        local luasnip = require "luasnip"
        local buf = vim.api.nvim_get_current_buf()
        for _ = 1, 10 do
          local node = luasnip.session.current_nodes[buf]
          luasnip.unlink_current_if_deleted()
          if luasnip.session.current_nodes[buf] == node then
            return
          end
        end
      end
      -- <C-y> accepts the highlighted completion (or the first one), otherwise
      -- expands the snippet trigger before the cursor
      conf.mapping["<C-y>"] = cmp.mapping(function(fallback)
        local luasnip = require "luasnip"
        if cmp.visible() then
          cmp.confirm { select = true }
        elseif luasnip.expandable() then
          luasnip.expand()
        else
          fallback()
        end
      end, { "i", "s" })
      -- <Tab>/<S-Tab> move between snippet fields and never touch the completion
      -- menu; inside a snippet <Tab> always jumps (use <C-y> to expand there)
      conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
        drop_deleted_snippets()
        local luasnip = require "luasnip"
        if luasnip.locally_jumpable(1) then
          cmp.close()
          luasnip.jump(1)
        elseif luasnip.expandable() then
          cmp.close()
          luasnip.expand()
        else
          fallback()
        end
      end, { "i", "s" })
      conf.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        drop_deleted_snippets()
        local luasnip = require "luasnip"
        if luasnip.locally_jumpable(-1) then
          cmp.close()
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
      return conf
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- jsregexp enables regex transforms in vscode-style snippets (friendly-snippets)
    build = "make install_jsregexp",
    opts = overrides.luasnip,
    config = function()
      require("luasnip").config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        -- leave a snippet once the cursor moves out of it or its text is deleted,
        -- so <Tab> doesn't jump back into stale snippets
        region_check_events = "CursorMoved,CursorMovedI",
        delete_check_events = "TextChanged,InsertLeave",
      }
      require("luasnip.loaders.from_lua").lazy_load { paths = { vim.fn.stdpath "config" .. "/lua/lua_snippets" } }
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/lua/lua_snippets/converted" },
      }
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
      vim.g.vimtex_quickfix_method = vim.fn.executable "pplatex" == 1 and "pplatex" or "latexlog"
      vim.g.tex_flavor = "luatex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      -- default to pdflatex (arXiv/revtex); use `% !TeX program = lualatex` per document to override
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-pdf",
      }
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        aux_dir = "build",
        out_dir = "build",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },

  {
    "nvim-telescope/telescope-bibtex.nvim",
    ft = "tex",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "bibtex"
    end,
  },
  {
    "jbyuki/nabla.nvim",
    ft = "tex",
  },

  {
    "smjonas/snippet-converter.nvim",
    config = function()
      local template = {
        sources = {
          ultisnips = {
            vim.fn.stdpath "config" .. "/lua/lua_snippets/ultisnips",
          },
          snipmate = {
            vim.fn.stdpath "config" .. "/lua/lua_snippets/snippets",
          },
        },
        output = {
          vscode_luasnip = {
            vim.fn.stdpath "config" .. "/lua/lua_snippets/converted",
          },
        },
      }

      require("snippet_converter").setup {
        templates = { template },
      }
    end,
  },
  {
    "preservim/vim-markdown",
    config = function()
      vim.g.vim_markdown_math = 1
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"
        require("dap-python").test_runner = "pytest"
      end,
    },
    config = function()
      local dap = require "dap"
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- This will launch the current file
          pythonPath = function()
            return "python"
          end,
        },
      }
      require "configs.python"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dapui"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "python",
    config = function()
      require "configs.neotest"
    end,
    -- config = function()
    --   require("neotest").setup {
    --     adapters = {
    --       require "neotest-python" {
    --         python = vim.fn.expand "python",
    --         root = function()
    --           return vim.fn.getcwd()
    --         end,
    --         dap = { justMyCode = false },
    --         args = { "--log-level", "DEBUG", "--verbose", "-xvs" },
    --         runner = "pytest",
    --         discovery = {
    --           enabled = true,
    --         },
    --         is_test_file = function(filename)
    --           return filename:match "^tests?%.?py$" or filename:match "^test_.+%.py$" or filename:match "%.test_.+%.py$"
    --         end,
    --         pytest_discover_instances = true,
    --       },
    --     },
    --   }
    -- end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    ft = { "python", "javascript", "typescript", "lua" }, -- Add filetypes you need
    opts = {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "reST", -- or "google_docstrings" or "reST"
          },
        },
      },
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      -- no autocomplete suggestions in prose filetypes
      vim.g.copilot_filetypes = { markdown = false, tex = false, plaintex = false, bib = false }
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-tree/nvim-tree.lua",
      "github/copilot.vim",
    },
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          model = "gpt-5.3-codex",
          timeout = 30000,
          temperature = 0,
          extra_request_body = {
            max_tokens = 4096,
          },
        },
      },
      behaviour = {
        support_paste_from_clipboard = true,
      },
      windows = {
        sidebar_header = {
          enabled = true,
        },
      },
      mappings = {
        files = {
          enabled = true,
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    -- branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      {
        -- model = 3gpt-4.1',           -- AI model to use
        temperature = 0.1,       -- Lower = focused, higher = creative
        window = {
          layout = "vertical",   -- 'vertical', 'horizontal', 'float'
          width = 0.3,           -- 50% of screen width
        },
        auto_insert_mode = true, -- Enter insert mode when opening
      },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    lazy = false,
    dependencies = {
      "CopilotC-Nvim/CopilotChat.nvim",
    },
    config = function()
      require("mcphub").setup({
        extensions = {
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true,
            convert_resources_to_functions = true,
            add_mcp_prefix = false,
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      -- telescope-bibtex only inserts the highlighted entry; insert every entry
      -- marked with <Tab> as a single \cite{a,b,c} instead
      local function cite_selected(prompt_bufnr)
        local actions = require "telescope.actions"
        local action_state = require "telescope.actions.state"
        local picker = action_state.get_current_picker(prompt_bufnr)
        local entries = picker:get_multi_selection()
        if vim.tbl_isempty(entries) then
          entries = { action_state.get_selected_entry() }
        end
        local keys = vim.tbl_map(function(entry)
          return entry.id.name
        end, entries)
        -- read the cursor before closing: once closed it has already shifted right
        local row, col = unpack(vim.api.nvim_win_get_cursor(picker.original_win_id))
        actions.close(prompt_bufnr)
        -- insert ~\cite{...} after the character under the cursor; if that
        -- character is whitespace, replace it so the ~ ties to the previous word
        local cite = "~\\cite{" .. table.concat(keys, ",") .. "}"
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
        local char = vim.fn.matchstr(line, "\\%" .. (col + 1) .. "c.")
        local start_col, end_col = col + #char, col + #char
        if char:match "^%s$" then
          start_col = col
        end
        vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, end_col, { cite })
        -- telescope's pending stopinsert moves the cursor one left, onto the
        -- closing }, then "a" appends after it (startinsert would be undone)
        vim.api.nvim_win_set_cursor(0, { row, start_col + #cite })
        vim.api.nvim_feedkeys("a", "n", true)
      end
      -- telescope-bibtex: use the .bib files referenced by the current document
      conf.extensions.bibtex = {
        context = true,
        context_fallback = true,
        mappings = { i = { ["<CR>"] = cite_selected }, n = { ["<CR>"] = cite_selected } },
      }
      return conf
    end,
  },

  -- Jupyter notebook support
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    ft = { "python", "markdown" },
    cmd = { "MoltenInit", "MoltenInfo" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
    },
  },
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "markdown" },
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup {
        lspFeatures = {
          enabled = false, -- Disable to use your existing LSP setup
          languages = { "r", "python", "julia", "bash", "lua", "html" },
        },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      }
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    ft = { "markdown" },
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
  },
  {
    "DuckTigger/stim-treesitter-parser",
    lazy = false, -- registers the parser via a TSUpdate autocmd before any :TSInstall
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("stim-treesitter-config").setup({
        -- defaults shown:
        highlight_measurements = true,
        keymaps = { show_info = "<leader>si" },
      })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
