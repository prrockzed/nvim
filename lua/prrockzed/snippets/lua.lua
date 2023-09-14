local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

-- snippets goes here
local firstSnippet = s("firstSnippet", {
	t({ "Hello! This is my first snippet in Luasnip", "" }),
	i(1, "placeholder_text"),
	t({ "", "This is another text node" }),
})

local secondSnippet = s(
	"secondSnippet",
	fmt(
		[[
    local {} = funciton({})
      {}
    end
]],
		{
			i(1, "myVar"),
			i(2, "myArg"),
			i(3, "-- TODO: something"),
		}
	)
)

-- adding snippets
ls.add_snippets("lua", {
  firstSnippet,
  secondSnippet,
})
