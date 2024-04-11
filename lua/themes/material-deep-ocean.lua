local M = {}

M.base_30 = {
  white = "#eeffff", -- confirmed
  darker_black = "#0e1018",
  black = "#0F111A", --  nvim bg
  black2 = "#191d2c",
  one_bg = "#202438",
  one_bg2 = "#292e48",
  one_bg3 = "#323857",
  grey = "#717CB4",
  grey_fg = "#7f89bb",
  grey_fg2 = "#7883b8",
  light_grey = "#c6cbe1",
  red = "#f07178",
  baby_pink = "#f6aaae",
  pink = "#f6aaae",
  line = "#313855", -- for lines like vertsplit
  green = "#c3e88d",
  vibrant_green = "#81bf27",
  nord_blue = "#6e98eb",
  blue = "#82aaff",
  yellow = "#ffcb6b",
  sun = "#ffc14e",
  purple = "#c792ea",
  dark_purple = "#a652de",
  teal = "#80cbc4",
  orange = "#f78c6c",
  cyan = "#89ddff",
  statusline_bg = "#2c364e",
  lightbg = "#1A1C25",
  pmenu_bg = "#84ffff",
  folder_bg = "#6e98eb",
}

-- Base16 colors taken from:
M.base_16 = {
  base00 = "#0f111a",
  base01 = "#313855",
  base02 = "#717CB4",
  base03 = "#717CB4",
  base04 = "#616575",
  base05 = "#eeffff",
  base06 = "#a5a9b5",
  base07 = "#313855",
  base08 = "#f07178",
  base09 = "#f78c6c",
  base0A = "#ffcb6b",
  base0B = "#c3e88d",
  base0C = "#89ddff",
  base0D = "#82aaff",
  base0E = "#c792ea",
  base0F = "#f07178",
}

M.polish_hl = {
	treesitter = {
		-- Section to have correct red in neovim terminal
		["@variable"] = { fg = M.base_30.white},
		["@module"] = { fg = M.base_30.white},
		["@variable.member"] = { fg = M.base_30.white},

    	["@type.builtin"] = { fg = M.base_30.purple },
    	["@variable.parameter"] = { fg = M.base_30.orange },
    	["@operator"] = { fg = M.base_30.cyan },
    	["@punctuation.delimiter"] = { fg = M.base_30.cyan },
    	["@punctuation.bracket"] = { fg = M.base_30.cyan },
    	["@punctuation.special"] = { fg = M.base_30.teal },
    	["@function.macro"] = { fg = M.base_30.pink },
    	["@keyword.storage"] = { fg = M.base_30.purple },
	},

  	syntax = {
    	StorageClass = { fg = M.base_30.purple },
    	Repeat = { fg = M.base_30.purple },
    	Define = { fg = M.base_30.blue },
  	},

  	telescope = {
    	TelescopeSelection = { bg = M.base_30.one_bg },
  	},
}

M.type = "dark"

M = require("base46").override_theme(M, "material-deep-ocean")

return M
