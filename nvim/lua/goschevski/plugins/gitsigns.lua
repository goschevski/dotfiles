return {
	"lewis6991/gitsigns.nvim",
	event = { "BufAdd" },
	keys = {
		{ "<Leader>gsh", "<cmd>Gitsigns preview_hunk<CR>" },
		{ "<Leader>grh", "<cmd>Gitsigns reset_hunk<CR>" },
		{ "]c", "<cmd>Gitsigns next_hunk<CR>" },
		{ "[c", "<cmd>Gitsigns prev_hunk<CR>" },
	},
	config = true,
}
