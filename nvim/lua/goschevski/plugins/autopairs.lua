return {
	"windwp/nvim-autopairs",
	opts = {
		check_ts = true,
		fast_wrap = {
			map = "<C-w>",
		},
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
	},
}
