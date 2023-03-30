return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>" },
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			live_filter = {
				always_show_folders = false,
			},
			view = {
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 40,
						height = 30,
						row = 1,
						col = 30,
					},
				},
			},
		})
	end,
}
