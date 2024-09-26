local status_ok, options = pcall(require, "ibl")
if not status_ok then
	return
end

options.setup({
	indent = {
		char = { "│", "-" },
		highlight = highlights,
		smart_indent_cap = false,
	},
	scope = {
		enabled = true,
		char = "│",
	},
})
