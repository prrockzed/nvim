local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
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
	-- SUPERSCRIPT
	s(
		{ trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- SUBSCRIPT
	s(
		{ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- SUBSCRIPT AND SUPERSCRIPT
	s(
		{ trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>^{<>}_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = tex.in_mathzone }
	),
	-- TEXT SUBSCRIPT
	s(
		{ trig = "sd", snippetType = "autosnippet", wordTrig = false },
		fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
		{ condition = tex.in_mathzone }
	),
	-- SUPERSCRIPT SHORTCUT
	-- Places the first alphanumeric character after the trigger into a superscript.
	s(
		{ trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = tex.in_mathzone }
	),
	-- SUBSCRIPT SHORTCUT
	-- Places the first alphanumeric character after the trigger into a subscript.
	s(
		{ trig = "([%w%)%]%}]):([%w])", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = tex.in_mathzone }
	),
	-- EULER'S NUMBER SUPERSCRIPT SHORTCUT
	s(
		{ trig = "([^%a])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),
	-- ZERO SUBSCRIPT SHORTCUT
	s(
		{ trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("0"),
		}),
		{ condition = tex.in_mathzone }
	),
	-- MINUS ONE SUPERSCRIPT SHORTCUT
	s(
		{ trig = "([%a%)%]%}])11", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("-1"),
		}),
		{ condition = tex.in_mathzone }
	),
	-- J SUBSCRIPT SHORTCUT (since jk triggers snippet jump forward)
	s(
		{ trig = "([%a%)%]%}])JJ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("j"),
		}),
		{ condition = tex.in_mathzone }
	),
	-- PLUS SUPERSCRIPT SHORTCUT
	s(
		{ trig = "([%a%)%]%}])%+%+", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("+"),
		}),
		{ condition = tex.in_mathzone }
	),
	-- COMPLEMENT SUPERSCRIPT
	s(
		{ trig = "([%a%)%]%}])CC", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("\\complement"),
		}),
		{ condition = tex.in_mathzone }
	),
	-- CONJUGATE (STAR) SUPERSCRIPT SHORTCUT
	s(
		{ trig = "([%a%)%]%}])%*%*", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("*"),
		}),
		{ condition = tex.in_mathzone }
	),
})
