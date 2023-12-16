return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>" },
	},
	config = true,
}
