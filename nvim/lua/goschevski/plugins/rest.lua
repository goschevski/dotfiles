return {
	"rest-nvim/rest.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	ft = {
		"http",
	},
	keys = {
		{ "<leader><CR>", "<Plug>RestNvim" },
	},
	config = function()
		require("rest-nvim").setup({
			result = {
				show_url = true,
				show_http_info = true,
				show_headers = false,
			},
		})
	end,
}
