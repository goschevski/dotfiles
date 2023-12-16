return {
	"dcampos/nvim-snippy",
	config = function()
		vim.g.vsnip_snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h") .. "/snippets"
	end,
}
