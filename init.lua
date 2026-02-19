vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

local function ensure_system_parsers_on_rtp()
  if #vim.api.nvim_get_runtime_file("parser/vimdoc.*", false) > 0 then
    return
  end

  for _, dir in ipairs { "/usr/lib/nvim", "/usr/lib64/nvim" } do
    if vim.uv.fs_stat(dir .. "/parser") then
      vim.opt.rtp:append(dir)
      return
    end
  end
end

-- Distro packages may ship parsers under /usr/lib*/nvim instead of runtime/.
ensure_system_parsers_on_rtp()

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- lazy can rewrite rtp, so restore system parser path after setup too.
ensure_system_parsers_on_rtp()

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
