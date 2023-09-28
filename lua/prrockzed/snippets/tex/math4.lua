local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

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
	-- DIFFERENTIAL, i.e. \diff
	s({ trig = "df", snippetType = "autosnippet", priority = 2000 }, {
		t("\\diff"),
	}, { condition = tex.in_mathzone }),
	-- BASIC INTEGRAL SYMBOL, i.e. \int
	s({ trig = "in1", snippetType = "autosnippet" }, {
		t("\\int"),
	}, { condition = tex.in_mathzone }),
	-- DOUBLE INTEGRAL, i.e. \iint
	s({ trig = "in2", snippetType = "autosnippet" }, {
		t("\\iint"),
	}, { condition = tex.in_mathzone }),
	-- TRIPLE INTEGRAL, i.e. \iiint
	s({ trig = "in3", snippetType = "autosnippet" }, {
		t("\\iiint"),
	}, { condition = tex.in_mathzone }),
	-- CLOSED SINGLE INTEGRAL, i.e. \oint
	s({ trig = "oi1", snippetType = "autosnippet" }, {
		t("\\oint"),
	}, { condition = tex.in_mathzone }),
	-- CLOSED DOUBLE INTEGRAL, i.e. \oiint
	s({ trig = "oi2", snippetType = "autosnippet" }, {
		t("\\oiint"),
	}, { condition = tex.in_mathzone }),
	-- GRADIENT OPERATOR, i.e. \grad
	s({ trig = "gdd", snippetType = "autosnippet" }, {
		t("\\grad "),
	}, { condition = tex.in_mathzone }),
	-- CURL OPERATOR, i.e. \curl
	s({ trig = "cll", snippetType = "autosnippet" }, {
		t("\\curl "),
	}, { condition = tex.in_mathzone }),
	-- DIVERGENCE OPERATOR, i.e. \divergence
	s({ trig = "DI", snippetType = "autosnippet" }, {
		t("\\div "),
	}, { condition = tex.in_mathzone }),
	-- LAPLACIAN OPERATOR, i.e. \laplacian
	s({ trig = "laa", snippetType = "autosnippet" }, {
		t("\\laplacian "),
	}, { condition = tex.in_mathzone }),
	-- HBAR, i.e., \hbar
	s({ trig = "hb", snippetType = "autosnippet" }, {
		t("\\hbar "),
	}, { condition = tex.in_mathzone }),
	-- PARALLEL SYMBOL, i.e. \parallel
	s({ trig = "||", snippetType = "autosnippet" }, {
		t("\\parallel"),
	}),
	-- CDOTS, i.e. \cdots
	s({ trig = "cdd", snippetType = "autosnippet" }, {
		t("\\cdots"),
	}),
	-- LDOTS, i.e. \ldots
	s({ trig = "ldd", snippetType = "autosnippet" }, {
		t("\\ldots"),
	}),
	-- EQUIV, i.e. \equiv
	s({ trig = "eqq", snippetType = "autosnippet" }, {
		t("\\equiv "),
	}),
	-- SETMINUS, i.e. \setminus
	s({ trig = "stm", snippetType = "autosnippet" }, {
		t("\\setminus "),
	}),
	-- SUBSET, i.e. \subset
	s({ trig = "sbb", snippetType = "autosnippet" }, {
		t("\\subset "),
	}),
	-- APPROX, i.e. \approx
	s({ trig = "px", snippetType = "autosnippet" }, {
		t("\\approx "),
	}, { condition = tex.in_mathzone }),
	-- PROPTO, i.e. \propto
	s({ trig = "pt", snippetType = "autosnippet" }, {
		t("\\propto "),
	}, { condition = tex.in_mathzone }),
	-- COLON, i.e. \colon
	s({ trig = "::", snippetType = "autosnippet" }, {
		t("\\colon "),
	}),
	-- IMPLIES, i.e. \implies
	s({ trig = ">>", snippetType = "autosnippet" }, {
		t("\\implies "),
	}),
	-- DOT PRODUCT, i.e. \cdot
	s({ trig = ",.", snippetType = "autosnippet" }, {
		t("\\cdot "),
	}),
	-- CROSS PRODUCT, i.e. \times
	s({ trig = "xx", snippetType = "autosnippet" }, {
		t("\\times "),
	}),
})
