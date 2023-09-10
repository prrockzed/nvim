local status_ok, options = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false

options.setup({
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	show_end_of_line = true,
})
