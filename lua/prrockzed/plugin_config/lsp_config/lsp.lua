local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local util = require("lspconfig/util")

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
-- lspconfig.clangd.setup({
-- 	cmd = {
-- 		"clangd",
-- 		"--offset-encoding=utf-16",
-- 	},
-- })

lspconfig.ccls.setup({})

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

-- go, gomod, gowork, gotmpl
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = {
		"go",
		"gomod",
		"gowork",
		"gotmpl",
	},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

-- rust
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})

-- servers(that don't need extra configuration)
local servers = { "vimls", "texlab" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
