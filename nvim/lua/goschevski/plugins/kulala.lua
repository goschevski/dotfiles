return {
	"mistweaverco/kulala.nvim",
	ft = "http",
	keys = {
		{
			"<leader>kr",
			function()
				require("kulala").run()
			end,
			desc = "send request",
		},
		{
			"<leader>kl",
			function()
				require("kulala").replay()
			end,
			desc = "replay last request",
		},
		{
			"<leader>kh",
			function()
				require("kulala").toggle_view()
			end,
			desc = "toggle between headers and body",
		},
		{
			"<leader>ky",
			function()
				require("kulala").copy()
			end,
			desc = "copy curl command",
		},
		{
			"<leader>kj",
			function()
				require("kulala").jump_next()
			end,
			desc = "jump next request",
		},
		{
			"<leader>kk",
			function()
				require("kulala").jump_prev()
			end,
			desc = "jump previous request",
		},
	},
	config = function()
		require("kulala").setup()
	end,
}
