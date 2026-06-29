vim.opt.spelllang = "en_gb"
vim.opt.spell = true

-- Suppress network connectivity errors from Copilot/GitHub API
-- This filters out DNS resolution failures and connection timeouts
-- while still showing other important errors
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  -- Patterns to ignore (network-related errors)
  local ignore_patterns = {
    "Could not resolve host",
    "curl error exit_code=6",
    "curl error exit_code=7",  -- Failed to connect
    "curl error exit_code=28", -- Timeout
    "api%.github%.com",
    "api%.githubcopilot%.com",
    "cannot resume dead coroutine", -- Consequence of network errors
  }

  -- Check if message matches any ignore pattern
  for _, pattern in ipairs(ignore_patterns) do
    if msg and type(msg) == "string" and msg:match(pattern) then
      -- Silently ignore this error
      return
    end
  end

  -- For all other messages, use original notify
  original_notify(msg, level, opts)
end

-- Also suppress error display for network-related callback failures
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Override error display to filter network errors
    local original_errmsg = vim.api.nvim_err_writeln
    vim.api.nvim_err_writeln = function(msg)
      -- Check if this is a network-related error
      if msg and type(msg) == "string" then
        local network_error_patterns = {
          "Could not resolve host",
          "curl error exit_code=[678]",
          "curl error exit_code=28",
          "api%.github",
          "cannot resume dead coroutine",
        }

        for _, pattern in ipairs(network_error_patterns) do
          if msg:match(pattern) then
            return -- Silently ignore
          end
        end
      end

      -- Show all other errors
      original_errmsg(msg)
    end
  end,
  once = true,
})

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
--
-- parser_config.stim = {
--   install_info = {
--     url = "/Users/andrewpatterson/stim-tresitter/", -- Local path to this repository
--     files = {"src/parser.c"},
--     branch = "main",
--     generate_requires_npm = false,
--     requires_generate_from_grammar = true,
--   },
--   filetype = "stim",
-- }
--
-- require('nvim-treesitter.configs').setup({
--   ensure_installed = {
--     -- your other parsers...
--   },
--
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
--   auto_install = false,  -- Prevent conflicts
--
--     -- Explicitly configure stim
--     parser_install_dir = vim.fn.stdpath("data") .. "/tree-sitter-parsers",
--   })

  -- Force reload stim filetype
vim.treesitter.language.register("stim", "stim")
vim.filetype.add({
  extension = {
    stim = 'stim',
  },
  filename = {
    ['*.stim'] = 'stim',
  },
})
-- package.path = package.path .. ';/Users/andrewpatterson/stim-treesitter/?.lua'
-- local ok, result = pcall(function()
--       return loadfile('/Users/andrewpatterson/stim-tresitter/lua/stim-treesitter.lua')
--   end)
--
--   if ok and result then
--       print("File found and loadable")
--       local module = result()
--       print("Module type:", type(module))
--
--       if module then
--           print("Module contents:")
--           for k, v in pairs(module) do
--               print("  " .. k .. ": " .. type(v))
--           end
--
--           if module.setup then
--               print("Setup function found, calling it...")
--               module.setup()
--               print("Setup completed successfully")
--           else
--               print("No setup function found in module")
--           end
--       else
--           print("Module is nil")
--       end
--   else
--       print("File not found or not loadable: " .. tostring(result))
--   end
-- Load and setup the plugin
-- require('stim-treesitter').setup()
-- local stim_treesitter_module = loadfile('/Users/andrewpatterson/stim-tresitter/lua/stim-treesitter.lua')()
--   stim_treesitter_module.setup()
--
-- -- Optional: Set up keybindings
-- vim.keymap.set('n', '<leader>si', ':StimInfoTS<CR>', { desc = 'Stim: Show measurement info' })

-- Notebook utilities
vim.api.nvim_create_user_command("NewNotebook", function(opts)
  require("configs.notebook").new_notebook(opts.args)
end, {
  nargs = "?",
  complete = "file",
  desc = "Create a new Jupyter notebook (markdown format)",
})
