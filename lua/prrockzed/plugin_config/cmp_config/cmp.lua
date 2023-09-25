local cmp_status_ok, options = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

options.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	window = {
		completion = options.config.window.bordered(),
		documentation = options.config.window.bordered(),
	},

	mapping = {
		["<C-p>"] = options.mapping.select_prev_item(),
		["<C-n>"] = options.mapping.select_next_item(),
		["<C-b>"] = options.mapping.scroll_docs(-4),
		["<C-f>"] = options.mapping.scroll_docs(4),
		["<C-c>"] = options.mapping.complete(),
		["<C-y>"] = options.config.disable,
		["<C-e>"] = options.mapping.abort(),

		["<CR>"] = options.mapping.confirm({
			behavior = options.ConfirmBehavior.Insert,
			select = true,
		}),

		["<Tab>"] = options.mapping(function(fallback)
			if options.visible() then
				options.select_next_item()
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<S-Tab>"] = options.mapping(function(fallback)
			if options.visible() then
				options.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
				nvim_lua = "[NVIM_LUA]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "lua-latex-symbols", option = { cache = true } },
	},

	confirm_opts = {
		behavior = options.ConfirmBehavior.Replace,
		select = false,
	},

	experimental = {
		ghost_text = true,
	},
})
