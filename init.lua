vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- Custom Plugins
-- local function load_custom_plugins()
--   local plugins = {}
--   local plugin_files = vim.fn.globpath("lua/custom/plugins", "*.lua", false, true)
--   for _, file in ipairs(plugin_files) do
--     local plugin = dofile(file)
--     table.insert(plugins, plugin)
--   end
--   return plugins
-- end

-- load plugins from main NvChad repo "https://github.com/NvChad/NvChad.git"
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
  { import = "custom.plugins" },  -- Load custom plugins
  -- unpack(load_custom_plugins()),  -- Load custom plugins
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- from main repo
require "nvchad.plugins"

-- Activate python environment in parent directory
-- require("custom.configs.auto_venv")

vim.schedule(function()
  require "mappings"
end)
