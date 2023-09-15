local status_ok, options = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local float = {
	focusable = true,
	style = "minimal",
	border = "single",
	source = "always",
	header = "",
	prefix = "",
}

options.setup({
	ui = {
		border = "single",
		style = "minimal",
		source = "always",
		header = "",
		prefix = "",
		width = 0.8,
		height = 0.8,
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},
	},

	keymaps = {
		toggle_server_expand = "<CR>",
		install_server = "i",
		update_server = "u",
		check_server_version = "c",
		update_all_servers = "U",
		check_outdated_servers = "C",
		uninstall_server = "X",
		cancel_installation = "<C-c>",
	},

	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 10,
})
