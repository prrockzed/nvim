local status_ok, options = pcall(require, "neorg")
if not status_ok then
	return
end

options.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/.notes",
					cp = "~/.notes/cp",
					dev = "~/.notes/dev",
					iitkgp = "~/.notes/iitkgp",
				},
			},
		},
	},
})
