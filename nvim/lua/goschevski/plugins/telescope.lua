return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	lazy = false,
	keys = {
		{ "<Leader>ff", "<cmd>Telescope find_files<CR>" },
		{ "<Leader>fr", "<cmd>Telescope resume<CR>" },
		{ "<Leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
		{ "<leader>fs", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
		{ "<Leader>fa", "<cmd>Telescope grep_string<CR>" },
		{ "<Leader>fk", "<cmd>Telescope keymaps<CR>" },
		{ "<Leader>fo", "<cmd>Telescope buffers<CR>" },
		{ "<Leader>fgl", "<cmd>Telescope git_commits<CR>" },
		{ "<Leader>fgf", "<cmd>Telescope git_bcommits<CR>" },
		{ "<Leader>fgb", "<cmd>Telescope git_branches<CR>" },
		{ "<Leader>fgs", "<cmd>Telescope git_status<CR>" },
		{ "<Leader>ft", "<cmd>Telescope filetypes<CR>" },
		{ "<Leader>fh", "<cmd>Telescope help_tags<CR>" },
		{ "<Leader>fc", "<cmd>Telescope colorscheme<CR>" },
		{ "<Leader>fm", "<cmd>Telescope commands<CR>" },
	},
	config = function()
		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")

		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["C-k"] = actions.move_selection_previous,
						["C-j"] = actions.move_selection_next,
						["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-t>"] = lga_actions.quote_prompt({ postfix = " --type-add 'vue:*.vue' -t " }),
							["<C-l>"] = lga_actions.quote_prompt({
								postfix = " --type-add 'vue:*.vue' -g !package-lock.json",
							}),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --type-add 'vue:*.vue' --iglob " }),
						},
					},
				},
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					ignore_current_buffer = true,
					sorter = require("telescope.sorters").get_substr_matcher(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")
	end,
}
