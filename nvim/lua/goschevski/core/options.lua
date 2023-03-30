local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- search
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- smart case search if there is uppercase

-- enable undo file
opt.undofile = true

-- tabs
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Enable break indent
opt.breakindent = true

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- no swap files
opt.swapfile = false

-- always show sign column
opt.signcolumn = "yes"

-- split vertical window to the right
opt.splitright = true
-- split horizontal window to the bottom
opt.splitbelow = true

-- disable inline diagnostics
vim.diagnostic.config({
	virtual_text = false,
})
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("yank_highlight", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})
