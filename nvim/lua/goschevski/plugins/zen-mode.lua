return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>zn", ":ZenMode<CR>" },
	},
	setup = function()
		require("zen-mode").setup({})
		vim.cmd("autocmd VimEnter * hi ZenBg ctermbg=NONE guibg=NONE")
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
