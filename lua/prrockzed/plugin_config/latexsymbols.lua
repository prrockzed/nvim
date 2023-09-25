local status_ok, options = pcall(require, "cmp")
if not status_ok then
	return
end

options.setup({
	sources = {
		{ name = "lua-latex-symbols", option = { cache = true } },
	},
})
