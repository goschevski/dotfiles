return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"diff",
				"go",
				"php",
				"regex",
				"vue",
			},
			auto_install = true,
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",
						["if"] = "@function.inner",
						["af"] = "@function.outer",
						["ic"] = "@class.inner",
						["ac"] = "@class.outer",
						["id"] = "@conditional.inner",
						["ad"] = "@conditional.outer",
					},
					include_surrounding_whitespace = true,
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]a"] = "@parameter.inner",
						["]]"] = "@class.outer",
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
						["[s"] = { query = "@scope", query_group = "locals", desc = "Prev scope" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
