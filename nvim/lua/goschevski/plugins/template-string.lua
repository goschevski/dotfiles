return {
	"axelvc/template-string.nvim",
	ft = {
		"html",
		"typescript",
		"javascript",
		"vue",
	},
	opts = {
		filetypes = {
			"html",
			"typescript",
			"javascript",
			"vue",
		}, -- filetypes where the plugin is active
		remove_template_string = true, -- remove backticks when there are no template strings
		restore_quotes = {
			normal = [[']],
		},
	},
}
