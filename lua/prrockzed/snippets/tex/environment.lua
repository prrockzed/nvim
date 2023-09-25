local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local d = ls.dynamic_node

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local env = s(
	{ trig = "new", snippetType = "autosnippet" },
	fmta(
		[[
      \begin{<>}
          <>
      \end{<>}
    ]],
		{
			i(1),
			i(2),
			rep(1), -- this node repeats insert node i(1)
		}
	),
	{ condition = line_begin }
)

ls.add_snippets("tex", {
	env,
})
