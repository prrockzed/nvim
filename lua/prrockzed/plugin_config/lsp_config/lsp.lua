local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local on_attach = require("prrockzed.plugin_config.lsp_config.handlers").on_attach
local capabilities = require("prrockzed.plugin_config.lsp_config.handlers").capabilities

-- lua
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- cpp
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
		"proto",
	},
})

-- python
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

-- typescript, javascript (with react)
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

-- servers(that don't need extra configuration)
local servers = {}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
