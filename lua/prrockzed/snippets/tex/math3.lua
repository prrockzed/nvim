local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local helpers = require("prrockzed.snippets.luasnip-helper-funcs")
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

-- adding snippets
ls.add_snippets("tex", {
	-- PARTIAL DERIVATIVE
	s(
		{ trig = "([^%a])pr", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\partial{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),

	-- DERIVATIVE with denominator only
	s(
		{ trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dv{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),

	-- DERIVATIVE with numerator and denominator
	s(
		{ trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dv{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),

	-- DERIVATIVE with numerator, denominator, and higher-order argument
	s(
		{ trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dv[<>]{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
		}),
		{ condition = tex.in_mathzone }
	),

	-- PARTIAL DERIVATIVE with denominator only
	s(
		{ trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdv{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),

	-- PARTIAL DERIVATIVE with numerator and denominator
	s(
		{ trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdv{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),

	-- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
	s(
		{ trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdv[<>]{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
		}),
		{ condition = tex.in_mathzone }
	),

	-- PARTIAL DERIVATIVE with numerator and 2 variable denominators
	s(
		{ trig = "([^%a])pv2", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdv{<>}{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
		}),
		{ condition = tex.in_mathzone }
	),

	-- PARTIAL DERIVATIVE with numerator and 3 variable denominators
	s(
		{ trig = "([^%a])pv3", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\frac{\\partial^3{<>}}{\\partial{<>}\\partial{<>}\\partial{<>}}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
			i(4),
		}),
		{ condition = tex.in_mathzone }
	),

	-- SUM with lower limit
	s(
		{ trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sum_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		}),
		{ condition = tex.in_mathzone }
	),

	-- SUM with upper and lower limit
	s(
		{ trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sum_{<>}^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),

	-- INTEGRAL with upper and lower limit
	s(
		{ trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\int_{<>}^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),

	-- INTEGRAL from positive to negative infinity
	s(
		{ trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\int_{\\infty}^{\\infty}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
		{ condition = tex.in_mathzone }
	),

	-- BOXED command
	s(
		{ trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\boxed{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
})
