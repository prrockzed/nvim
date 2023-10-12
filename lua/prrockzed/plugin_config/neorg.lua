vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	command = "set conceallevel=2",
})
local status_ok, options = pcall(require, "neorg")
if not status_ok then
	return
end

options.setup({
	load = {
		["core.keybinds"] = {
			config = {
				default_keybinds = false,
				hook = function(keybinds)
					keybinds.map("norg", "n", "<C-j>", "<cmd> Neorg keybind norg core.itero.next-iteration <CR>a")
					keybinds.map("norg", "n", "<CR>", "<cmd> Neorg keybind norg core.esupports.hop.hop-link <CR>")
					keybinds.map("norg", "n", "fa", "==")
				end,
			},
		},
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/.notes",
					cp = "~/.notes/cp",
					dev = "~/.notes/dev",
					iitkgp = "~/.notes/iitkgp",
					entertainment = "~/.notes/entertainment",
				},
			},
		},
	},
})
