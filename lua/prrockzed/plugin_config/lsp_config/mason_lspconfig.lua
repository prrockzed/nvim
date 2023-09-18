local status_ok, options = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local server = {
	-- list of servers for mason to install
	"",
}

options.setup({
	ensure_installed = server,
	automatic_installation = true,
})
