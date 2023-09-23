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

	-- the legendary language server protocol - nvim lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
	},

	-- linting and formatting with the help of lspconfig
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},

	-- package manager for neovim lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- which-key plugin
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		{ "folke/neoconf.nvim", cmd = "Neoconf" },
		"folke/neodev.nvim",
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

	-- luasnips + cmp
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

	-- running code
	{
		"CRAG666/code_runner.nvim",
		event = "VeryLazy",
	},

	-- competitive programming - cpbooster plugin
	{
		"searleser97/cpbooster.vim",
		event = "VeryLazy",
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

	-- automatically highlights other uses of the word under the cursor
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		config = function()
			require("illuminate").configure({ delay = 500 })
		end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
	},

	-- vim-fugitive
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},

	-- dashboard/opening setup
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
		event = "VeryLazy",
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

	-- rust language plugin for formatting
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
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
}

return plugins
