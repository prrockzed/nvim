local status_ok, options = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

-- list of servers for mason to install
local server = {
	-- for lua
	"lua_ls",
	"stylua",
}

options.setup({
	ensure_installed = server,
	automatic_installation = true,
})
