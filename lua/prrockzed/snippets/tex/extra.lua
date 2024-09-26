local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Environment/syntax context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

-- adding snippets
ls.add_snippets("tex", {
	-- UNION
	s({ trig = "cu", snippetType = "autosnippet", priority = 2000 }, {
		t("\\cup"),
	}, { condition = tex.in_mathzone }),

	-- INTERSECRION
	s({ trig = "ca", snippetType = "autosnippet", priority = 2000 }, {
		t("\\cap"),
	}, { condition = tex.in_mathzone }),

	-- HBAR, i.e., \hbar
	s({ trig = "hb", snippetType = "autosnippet" }, {
		t("\\hbar "),
	}, { condition = tex.in_mathzone }),

	-- IOTA, i.e., \iota
	s({ trig = "io", snippetType = "autosnippet" }, {
		t("\\iota"),
	}, { condition = tex.in_mathzone }),

	-- BELONGS TO, i.e., \in
	s({ trig = "be", snippetType = "autosnippet" }, {
		t("\\in "),
	}, { condition = tex.in_mathzone }),

	-- TO, i.e., \to
	s({ trig = "to", snippetType = "autosnippet" }, {
		t("\\to "),
	}, { condition = tex.in_mathzone }),

	-- LEFT VERTICAL SIGN, i.e., \lvert
	s({ trig = "lv", snippetType = "autosnippet" }, {
		t("\\lvert "),
	}, { condition = tex.in_mathzone }),

	-- RIGHT VERTICAL SIGN, i.e., \rvert
	s({ trig = "rv", snippetType = "autosnippet" }, {
		t("\\rvert "),
	}, { condition = tex.in_mathzone }),

	-- LEFT RIGHT VERTICAL SIGN, i.e., \rvert
	s({ trig = "rv", snippetType = "autosnippet" }, {
		t("{\\lvert <> \\rvert}"),
	}, { condition = tex.in_mathzone }),

	-- LEFT RIGHT VERTICAL SIGN, i.e., \rvert
	s(
		{ trig = "lrv", snippetType = "autosnippet" },
		fmta(
			[[
      {\lvert <> \rvert}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_mathzone }
	),

	-- LIMIT
	s(
		{ trig = "lm", snippetType = "autosnippet" },
		fmta(
			[[
      \lim_{<>}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_mathzone }
	),

	-- BRA
	s(
		{ trig = "rr", snippetType = "autosnippet" },
		fmta(
			[[
      \bra{<>}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_mathzone }
	),

	-- KET
	s(
		{ trig = "kk", snippetType = "autosnippet" },
		fmta(
			[[
      \ket{<>}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_mathzone }
	),

	-- BRAKET
	s(
		{ trig = "ak", snippetType = "autosnippet" },
		fmta(
			[[
      \bra{<>}\ket{<>}
      ]],
			{
				i(1),
				i(2),
			}
		),
		{ condition = tex.in_mathzone }
	),

	-- ANGULAR BRAKETS
	s(
		{ trig = "ang", snippetType = "autosnippet" },
		fmta(
			[[
      {\langle{<>}\rangle}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_mathzone }
	),
})
