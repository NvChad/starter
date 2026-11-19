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
tex.in_text = function()
  return not tex.in_mathzone()
end

-- math-only autosnippet. Symbol triggers ("//", "->") fire anywhere; letter
-- triggers ("sum", "bb") only fire after a non-letter that isn't "\", so typing
-- \sum or \mathbb by hand still works.
local function ms(trig, nodes)
  local wordy = trig:match "^%a" ~= nil
  return s({ trig = trig, wordTrig = false, snippetType = "autosnippet" }, nodes, {
    condition = function(line_to_cursor, matched)
      if not tex.in_mathzone() then
        return false
      end
      local before = line_to_cursor:sub(-#matched - 1, -#matched - 1)
      return not wordy or not before:match "[%a\\]"
    end,
  })
end

local greek = {
  a = "alpha", b = "beta", g = "gamma", G = "Gamma", d = "delta", D = "Delta",
  e = "epsilon", z = "zeta", h = "eta", t = "theta", T = "Theta", k = "kappa",
  l = "lambda", L = "Lambda", m = "mu", n = "nu", x = "xi", p = "pi", P = "Pi",
  r = "rho", s = "sigma", S = "Sigma", u = "tau", f = "phi", F = "Phi",
  c = "chi", y = "psi", Y = "Psi", o = "omega", O = "Omega",
}

local autosnippets = {
  -- entering math (text only)
  s({ trig = "mk", snippetType = "autosnippet" }, { t "$", i(1), t "$", i(0) }, { condition = tex.in_text }),
  s({ trig = "dm", snippetType = "autosnippet" }, { t { "\\[", "\t" }, i(1), t { "", "\\]" }, i(0) },
    { condition = tex.in_text }),

  -- fractions, roots, scripts
  ms("//", { t "\\frac{", i(1), t "}{", i(2), t "}", i(0) }),
  ms("sq", { t "\\sqrt{", i(1), t "}", i(0) }),
  ms("__", { t "_{", i(1), t "}", i(0) }),
  ms("td", { t "^{", i(1), t "}", i(0) }),
  ms("sr", { t "^2" }),
  ms("cb", { t "^3" }),
  ms("invs", { t "^{-1}" }),
  s({ trig = "(%a)(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    { f(function(_, snip) return snip.captures[1] .. "_" .. snip.captures[2] end) },
    { condition = tex.in_mathzone }),

  -- operators and relations
  ms("sum", { t "\\sum_{", i(1), t "}^{", i(2), t "}", i(0) }),
  ms("prod", { t "\\prod_{", i(1), t "}^{", i(2), t "}", i(0) }),
  ms("int", { t "\\int_{", i(1), t "}^{", i(2), t "}", i(0) }),
  ms("ooo", { t "\\infty" }),
  ms("...", { t "\\ldots" }),
  ms("=>", { t "\\implies" }),
  ms("!=", { t "\\neq" }),
  ms("<=", { t "\\le" }),
  ms(">=", { t "\\ge" }),
  ms("->", { t "\\to" }),
  ms("xx", { t "\\times" }),
  ms("**", { t "\\cdot" }),
  ms("bb", { t "\\mathbb{", i(1), t "}", i(0) }),
  ms("cal", { t "\\mathcal{", i(1), t "}", i(0) }),
  ms("tt", { t "\\text{", i(1), t "}", i(0) }),
}

-- Greek letters: ;a -> \alpha, ;G -> \Gamma, ...
for key, name in pairs(greek) do
  table.insert(autosnippets, ms(";" .. key, { t("\\" .. name) }))
end

local snippets = {
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

-- Sectioning: \section{Title}\label{sec:title}. The label is the title lowercased,
-- with special characters removed and spaces/hyphens turned into underscores.
-- Overrides friendly-snippets' versions (higher priority), keeping their triggers.
local function to_label(args)
  local title = args[1][1]:lower():gsub("[%s%-]+", " "):gsub("[^%w ]", "")
  return (vim.trim(title):gsub(" +", "_"))
end

local sections = {
  { "part", "part", "prt" },
  { "cha", "chapter", "chap" },
  { "sec", "section", "sec" },
  { "sub", "subsection", "sub" },
  { "subs", "subsubsection", "subsub" },
  { "par", "paragraph", "par" },
  { "subp", "subparagraph", "subp" },
}
for _, sec in ipairs(sections) do
  local trig, cmd, prefix = sec[1], sec[2], sec[3]
  table.insert(snippets, s({ trig = trig, name = cmd, dscr = "\\" .. cmd .. " with label", priority = 2000 }, {
    t("\\" .. cmd .. "{"), i(1), t("}\\label{" .. prefix .. ":"), f(to_label, { 1 }), t({ "} % (fold)", "" }),
    i(0),
    t({ "", "% " .. cmd .. " " }), f(function(args) return args[1][1] end, { 1 }), t(" (end)"),
  }))
end

-- \begin{env}...\end{env}: expands on <Tab> only (as an autosnippet it fired while typing \begin)
table.insert(snippets, s({ trig = "beg", name = "begin/end", priority = 2000 },
  { t "\\begin{", i(1), t { "}", "\t" }, i(0), t { "", "\\end{" }, f(function(args) return args[1][1] end, { 1 }), t "}" },
  { condition = tex.in_text }))

-- itm -> new line + \item, auto-expanding only directly inside list environments.
-- Indentation copies the previous \item, or the \begin line plus one shiftwidth.
local list_envs = {
  itemize = true, enumerate = true, description = true,
  compactitem = true, compactenum = true, compactdesc = true,
  inparaenum = true, asparaenum = true, asparaitem = true,
}
local item_ctx -- set by the condition, read by the snippet body

local function in_list_env(line_to_cursor, matched)
  local before = line_to_cursor:sub(1, #line_to_cursor - #matched)
  if not matched:match "^%s" and before:match "[%a\\]$" then
    return false -- part of a word, e.g. "submitm"
  end
  local env = vim.fn["vimtex#env#get_inner"]()
  if not (env.name and list_envs[env.name:gsub("%*$", "")]) then
    return false
  end
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local indent
  for lnum = row, env.open.lnum + 1, -1 do
    local prev = vim.fn.getline(lnum)
    if prev:match "^%s*\\item" then
      indent = prev:match "^%s*"
      break
    end
  end
  if not indent then
    local unit = vim.bo.expandtab and string.rep(" ", vim.fn.shiftwidth()) or "\t"
    indent = vim.fn.getline(env.open.lnum):match "^%s*" .. unit
  end
  item_ctx = { indent = indent, blank = before:match "^%s*$" ~= nil }
  return true
end

table.insert(autosnippets, s({ trig = "%s*itm", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, {
  isn(1, {
    f(function()
      local item = item_ctx.indent .. "\\item "
      -- on an empty line reuse it, otherwise start a new line
      return item_ctx.blank and item or { "", item }
    end),
  }, ""),
  i(0),
}, { condition = in_list_env }))

return snippets, autosnippets
