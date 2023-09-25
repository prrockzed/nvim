-- indentation settings
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- previews html file in safari browser
vim.keymap.set("n", "<F5>", "<cmd> !open -a Safari % <CR><CR>")
