local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local tex = {}
tex.in_mathzone = function()
  return vim .fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s("ket", {
    t({"\\ket{"}),
    i(1),
    t({"}"}),
    i(0)
  },
    {condition = tex.in_mathzone }
  ),
  s("lrb", {
    t({"\\left( "}),
    i(1),
    t(" \\right) "),
    i(0)
  }),
  s("lra", {
    t({"\\langle "}),
    i(1),
    t(" \\rangle "),
    i(0)
  }),
  s("lrs", {
    t({"\\left\\[ "}),
    i(1),
    t(" \\right\\] "),
    i(0)
  }),
  s("lrc", {
    t({"\\left\\{ "}),
    i(1),
    t(" \\right\\} "),
    i(0)
  }),
  s("~", {
    t("\\tilde{"),
    i(1),
    t("} "),
    i(0)
  }
  ),
  s("^", {
    t("\\hat{"),
    i(1),
    t("} "),
    i(0)
  }
  ),
  s("trm", {
    t("\\textrm{"),
    i(1),
    t("} "),
    i(0)
  }
  ),
  s("figcirc", {
    t({"\\begin{figure}[h]",
    "\t\\begin{center}",
    "\t\t\\begin{tikzpicture}",
    "\t\t\t\\begin{yquant}",
    "\t\t\t\tqubit {$\\ket{"}),
    i(3),
    t("}$} "),
    t("q["),
    i(5),
    t({"];",
    "\t\t\t\t"}),
    i(6),
    t({"",
    "\t\t\t\\end{yquant}",
    "\t\t\\end{tikzpicture}",
    "\t\\end{center}",
    "\t\\caption{"}),
    i(1),
    t("}\\label{fig:"),
    i(2),
    t({"}",
    "\\end{figure}"}),
    i(0)
  }
  ),

}
