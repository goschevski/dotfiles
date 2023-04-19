vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])

require("lazy").setup("goschevski.plugins")
require("goschevski.core.utils")
require("goschevski.core.options")
require("goschevski.core.mappings")
