local ls = require("luasnip")
local s = ls.snippet
local d = ls.dynamic_node
local f = ls.function_node
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

-- LEFT/RIGHT PARENTHESES
local parentheses = s(
	{ trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\left(<>\\right)", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)

-- LEFT/RIGHT SQUARE BRACES
local sqBraces = s(
	{ trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\left[<>\\right]", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)

-- LEFT/RIGHT CURLY BRACES
local curlyBraces = s(
	{ trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\left\\{<>\\right\\}", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)

-- BIG PARENTHESES
local bigParentheses = s(
	{ trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\big(<>\\big)", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)
-- BIG SQUARE BRACES
local bigsqBraces = s(
	{ trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\big[<>\\big]", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)
-- BIG CURLY BRACES
local bigcurlyBraces = s(
	{ trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
	fmta("<>\\big\\{<>\\big\\}", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)
-- ESCAPED CURLY BRACES
local esccurlyBraces = s(
	{ trig = "([^%a])\\%{", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
	fmta("<>\\{<>\\}", {
		f(function(_, snip)
			return snip.captures[1]
		end),
		d(1, get_visual),
	})
)
-- LATEX QUOTATION MARK
local qmark = s(
	{ trig = "``", snippetType = "autosnippet" },
	fmta("``<>''", {
		d(1, get_visual),
	})
)

-- add snippets
ls.add_snippets("tex", {
	parentheses,
	sqBraces,
	curlyBraces,
	bigParentheses,
	bigsqBraces,
	bigcurlyBraces,
	esccurlyBraces,
	qmark,
})
