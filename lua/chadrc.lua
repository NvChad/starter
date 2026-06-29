---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add
}
return M
