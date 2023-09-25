local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fraction = s("ff", {
	t("\\frac{"),
	i(1), -- insert node 1
	t("}{"),
	i(2), -- insert node 2
	t("}"),
})

ls.add_snippets("tex", {
	s(";a", t("\\alpha")),
	s(";b", t("\\beta")),
	s(";g", t("\\gamma")),
	fraction,
})
