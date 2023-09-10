local options = {
	-- others
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)

	-- numbers and cursorline
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	cursorline = true, -- highlight the current line
	cursorlineopt = "number",

	-- indenting
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab

	-- nvim setup
	laststatus = 3,
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height

	-- fonts
	termguicolors = true, -- set term gui colors (most terminals support this)
	guifont = "Hack\\ Nerd\\ Font:h16", -- the font used in graphical neovim applications

	-- alignment
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line

	-- indent blankline options
	list = true,

	-- file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	fileencoding = "utf-8", -- the encoding written to a file
	undofile = true, -- enable persistent undo
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

-- for alignment of nvim tree
vim.opt.fillchars:append("vert:▕")

-- for end of line
vim.opt.listchars:append("eol:↴")

for k, v in pairs(options) do
	vim.opt[k] = v
end
