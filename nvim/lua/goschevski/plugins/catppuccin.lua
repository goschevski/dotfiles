local theme = "macchiato"
-- local theme = "latte"

return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = theme,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = { "bold" },
				booleans = { "italic" },
				properties = {},
				types = { "bold" },
				operators = {},
			},
		})

		vim.cmd("colorscheme catppuccin-" .. theme)
	end,
}
