return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		vim.o.foldenable = true -- enable fold for nvim-ufo
		vim.o.foldlevel = 99 -- set high foldlevel for nvim-ufo
		vim.o.foldlevelstart = 99 -- start with all code unfolded
		vim.o.foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil -- show foldcolumn in nvim 0.9
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- these are "extra", change them as you like
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
		vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor)

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
