local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- search
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- smart case search if there is uppercase

-- tabs
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- no swap files
vim.opt.swapfile = false

-- always show sign column
opt.signcolumn = "yes" 

-- split vertical window to the right
opt.splitright = true
-- split horizontal window to the bottom
opt.splitbelow = true 
