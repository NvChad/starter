-- neovide settings
if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h10"
  vim.o.winblend = 30

  -- vim.g.neovide_transparency = 1.0
  -- vim.g.transparency = 0.0
  -- vim.opts.defaults.winblend

  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_remember_window_size = true

  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.03
  vim.g.neovide_cursor_animate_command_line = true

  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.neovide_floating_blur_amount_y = 4.0


  vim.api.nvim_set_hl(0, "TelescopeNormal", {
    bg = "none",
  })

  vim.cmd [[
    set winblend=30
    set pumblend=30

    " hi PmenuSel blend=0
    " hi TelescopeNormal blend=0

    " autocmd FileType * setlocal winblend=30
    " augroup floating_windows
    "   autocmd!
    "   autocmd WinEnter,WinNew * if vim.api.nvim_win_get_config(0).relative ~= '' then vim.api.nvim_win_set_option(0, 'winblend', 30) end
    " augroup END
    " au WinEnter,WinNew * if &float | setlocal winblend=30 | endif
  ]]
end

-- if vim.fn.has "win32" == 1 then
--   vim.o.shell = "pwsh.exe"
--   vim.o.shellcmdflag = "-Command"
--   vim.o.shellxquote = ""
--   vim.o.shellquote = ""
--   vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
--   vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
-- else
--   -- Leave the default shell for non-Windows systems
-- end

-- vim.opt.relativenumber = true
-- FIX: misspelling detection sucks
vim.opt.spelllang = "en_us"
-- Disabling spelling because it is enabled in terminal
vim.opt.spell = false

-- TODO: set up highlight hovering word
-- TODO: Set up show scope like vscode.
-- TODO: Set up snippets from vscode (drv*, struct, ...)

-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  nvdash = {
    load_on_startup = true,

    header = {
      "      ____________       ",
      "     ╱╲  ________ ╲      ",
      "    ╱  ╲ ╲______╱╲ ╲     ",
      "   ╱ ╱╲ ╲ ╲  ╱ ╱╲ ╲ ╲    ",
      "  ╱ ╱ ╱╲ ╲ ╲╱ ╱ ╱╲ ╲ ╲   ",
      " ╱ ╱ ╱__╲_╲╱ ╱ ╱__╲_╲ ╲  ",
      "╱ ╱ ╱_______╱ ╱________╲ ",
      "╲ ╲ ╲______ ╲ ╲______  ╱ ",
      " ╲ ╲ ╲  ╱ ╱╲ ╲ ╲  ╱ ╱ ╱  ",
      "  ╲ ╲ ╲╱ ╱ ╱╲ ╲ ╲╱ ╱ ╱   ",
      "   ╲ ╲╱ ╱ ╱__╲_╲╱ ╱ ╱    ",
      "    ╲  ╱ ╱______╲╱ ╱     ",
      "     ╲╱___________╱      ",
    },

    buttons = {
      { "  Sessions", "Spc c s", "Telescope session-lens" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  }
}

M.base46 = {
  theme = "onedark",
  hl_override = {
    Todo = { link = "Comment" },
    Comment = { italic = true },
    Type = { fg = "#73d0ff" },
    ["@keyword.repeat"] = { link = "@keyword" },
    Repeat = { link = "Keyword" },
    ["@type.builtin"] = { link = "Type" },

    Function = { fg = "#ffd173" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },

    Variable = { fg = "#ff7373" },
    ["@variable"] = { link = "Variable" },

    Constant = { fg = "#f2ff00" },
    ["@constant"] = { link = "Constant" },

    Include = { link = "Keyword" },
  },
  lsp_semantic_tokens = true,
  telescope = {
    style = "bordered",
  },
  statusline = {
    separator_style = "round",
  },
}

vim.api.nvim_set_hl(0, "@lsp.mod.associated", { italic = true })

-- Highlight groups for other elements
vim.api.nvim_set_hl(0, "@lsp.type.decorator", { bold = true, fg = "#ff9900" })
vim.api.nvim_set_hl(0, "@lsp.type.derive", { bold = true, fg = "#ff9900" })

vim.api.nvim_set_hl(0, "@lsp.type.function", { bold = true, fg = "#ffd173" })
vim.api.nvim_set_hl(0, "@lsp.type.method", { bold = true, italic = true, fg = "#ffd173" })

vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { bold = true, italic = true, fg = "#ff7391" })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { bold = true, fg = "#eb3f8f" })
vim.api.nvim_set_hl(0, "@lsp.type.namespace", { bold = true, fg = "#ff73ea" })

vim.api.nvim_set_hl(0, "@lsp.mod.const", { bold = true, fg = "#f2ff00" })
-- We can't set this to const color because rust-analyzer tags const keyword as "@lsp.mod.constant"--
-- vim.api.nvim_set_hl(0, "@lsp.mod.constant", { link = "@lsp.mod.const" })
vim.api.nvim_set_hl(0, "@lsp.mod.readonly", { link = "@lsp.mod.const" })
vim.api.nvim_set_hl(0, "@lsp.type.const", { link = "@lsp.mod.const" })
vim.api.nvim_set_hl(0, "@lsp.type.constParameter", { link = "@lsp.mod.const" })

vim.api.nvim_set_hl(0, "@lsp.type.parameter", { bold = true, fg = "#92de53" })
vim.api.nvim_set_hl(0, "@lsp.type.property", { bold = true, italic = true, fg = "#53de8d" })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { bold = true, fg = "#53de8d" })

-- Highlight groups for types

vim.api.nvim_set_hl(0, "@lsp.type.typeAlias", { link = "@lsp.type.class" })
vim.api.nvim_set_hl(0, "@lsp.type.class", { bold = true, fg = "#73d0ff" })
vim.api.nvim_set_hl(0, "@lsp.type.class", { bold = true, fg = "#73d0ff" })
vim.api.nvim_set_hl(0, "@lsp.type.enum", { bold = true, fg = "#73d0ff", italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.primitive", { link = "@lsp.type.class" })
vim.api.nvim_set_hl(0, "@lsp.type.builtinType", { link = "@lsp.type.class" })
vim.api.nvim_set_hl(0, "@lsp.type.struct", { link = "@lsp.type.class" })
vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "@lsp.type.class" })

vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { bold = true, italic = true, fg = "#73ffde" })

vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { bold = true, fg = "#d19a66" })


return M
