-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
---@class Base46Config
---@field theme? string
---@field hl_add? table<string, any>
---@field hl_override? table<string, any>
---@field integrations? table<string, any>
---@field changed_themes? table<string, any>
---@field transparency? boolean
---@field theme_toggle? string[]

---@class CmpConfig
---@field icons_left? boolean
---@field lspkind_text? boolean
---@field style? "default"|"flat_light"|"flat_dark"|"atom"|"atom_colored"
---@field format_colors? { tailwind?: boolean, icon?: string }

---@class StatuslineConfig
---@field enabled? boolean
---@field theme? "default"|"vscode"|"vscode_colored"|"minimal"
---@field separator_style? "default"|"round"|"block"|"arrow"
---@field order? string[]
---@field modules? table<string, any>

---@class TabuflineConfig
---@field enabled? boolean
---@field lazyload? boolean
---@field order? string[]
---@field modules? table<string, any>

---@class UIConfig
---@field cmp? CmpConfig
---@field telescope? { style?: "borderless"|"bordered" }
---@field statusline? StatuslineConfig
---@field tabufline? TabuflineConfig

---@class DashButton
---@field txt? string|function
---@field keys? string
---@field cmd? string
---@field hl? string
---@field no_gap? boolean
---@field rep? boolean

---@class NvDashConfig
---@field load_on_startup? boolean
---@field header? string[]
---@field buttons? DashButton[]

---@class TermConfig
---@field winopts? { number?: boolean, relativenumber?: boolean }
---@field sizes? { sp?: number, vsp?: number, ["bo sp"]?: number, ["bo vsp"]?: number }
---@field float? { relative?: string, row?: number, col?: number, width?: number, height?: number, border?: string }

---@class ColorifyConfig
---@field enabled? boolean
---@field mode? "fg"|"bg"|"virtual"
---@field virt_text? string
---@field highlight? { hex?: boolean, lspvars?: boolean }

---@class ChadrcConfig
---@field base46? Base46Config
---@field ui? UIConfig
---@field nvdash? NvDashConfig
---@field term? TermConfig
---@field lsp? { signature?: boolean }
---@field cheatsheet? { theme?: "simple"|"grid", excluded_groups?: string[] }
---@field mason? { pkgs?: table<string, any> }
---@field colorify? ColorifyConfig
---
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
