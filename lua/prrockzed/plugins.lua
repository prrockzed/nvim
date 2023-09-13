local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- dump your plugins here
local plugins = {
	-- for lua functions which i don't want to write twice
	{
		"nvim-lua/plenary.nvim",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim", -- sets vim.ui.select to telescope
		event = "VeryLazy",
	},

	-- which-key plugin
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		{ "folke/neoconf.nvim", cmd = "Neoconf" },
		"folke/neodev.nvim",
	},

	-- colorscheme plugins
	{
		"navarasu/onedark.nvim",
		lazy = false,
	},
	{
		"EdenEast/nightfox.nvim",
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
	},
	{
		"romgrk/doom-one.vim",
		event = "VeryLazy",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
	},
	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
	},
	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
	},

	-- tree sitter for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
	},

	-- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				"rafamadriz/friendly-snippets",
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
		},
	},

	-- status line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- tabline at the top
	{
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

	-- lazy git plugin for neovim
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- for comments
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- gitsigns to highlight git changes
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
	},

	-- vim-fugitive
	{
		"tpope/vim-fugitive",
	},

	-- dashboard/opening setup
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	-- to browse in internet from nvchad
	{
		"lalitmee/browse.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- toggleterm for terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
	},

	-- indent blankline
	{
		"lukas-reineke/indent-blankline.nvim",
	},

	-- rainbow plugin for colorful brackets
	{
		"HiPhish/rainbow-delimiters.nvim",
		lazy = false,
	},

	-- improved vim ui
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	-- cheatsheet plugin
	{
		"sudormrfbin/cheatsheet.nvim",
		event = "VeryLazy",
	},
}

require("lazy").setup(plugins)
