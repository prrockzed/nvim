local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local italics = s(";it", {
	t("\\textit{"),
	i(1),
	t("}"),
})

local bold = s(";bd", {
	t("\\textbf{"),
	i(1),
	t("}"),
})

local item = s({ trig = "ii", snippetType = "autosnippet" }, {
	t("\\item "),
}, { condition = line_begin })

ls.add_snippets("tex", {
	item,
	italics,
	bold,
})
