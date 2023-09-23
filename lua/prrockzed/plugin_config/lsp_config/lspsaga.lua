local status_ok, options = pcall(require, "lspsaga")
if not status_ok then
	return
end

options.setup({
	symbol_in_winbar = {
		enable = false,
	},
})
