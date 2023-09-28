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
	-- VECTOR, i.e. \vec
	s(
		{ trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\vec{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
	s(
		{ trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\unitvector_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- UNIT VECTOR WITH HAT, i.e. \uvec{}
	s(
		{ trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\uvec{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- MATRIX, i.e. \vec
	s(
		{ trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\mat{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- FRACTION
	s(
		{ trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\frac{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),
	-- ANGLE
	s(
		{ trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\ang{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- ABSOLUTE VALUE
	s(
		{ trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\abs{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- SQUARE ROOT
	s(
		{ trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sqrt{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- BINOMIAL SYMBOL
	s(
		{ trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\binom{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),
	-- LOGARITHM WITH BASE SUBSCRIPT
	s(
		{ trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\log_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		}),
		{ condition = tex.in_mathzone }
	),
})
