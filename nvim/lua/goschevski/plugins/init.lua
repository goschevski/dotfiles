return {
	-- bunch of plugins need this
	"nvim-lua/plenary.nvim",

	"xiyaowong/transparent.nvim",

	{
		"crispydrone/vim-tasks",
		ft = {
			"TODO",
			"todo",
			"todolist",
			"taskpaper",
			"tasks",
		},
	},

	-- vim -> tmux integration
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			"<C-h>",
			"<C-j>",
			"<C-k>",
			"<C-l>",
		},
	},

	-- git
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gst", "<cmd>Git<cr>" },
			{ "<leader>gb", "<cmd>Git blame<cr>" },
			{ "<leader>gco", "<cmd>Gread<cr>:w<CR>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufAdd" },
		keys = {
			{ "<Leader>gsh", "<cmd>Gitsigns preview_hunk<CR>" },
			{ "<Leader>grh", "<cmd>Gitsigns reset_hunk<CR>" },
			{ "]c", "<cmd>Gitsigns next_hunk<CR>" },
			{ "[c", "<cmd>Gitsigns prev_hunk<CR>" },
		},
		config = true,
	},

	-- essentials
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	"tpope/vim-surround",
	"tpope/vim-repeat",
	{
		"mattn/emmet-vim",
		ft = {
			"vue",
			"html",
		},
	},
	{
		"Wansmer/treesj",
		keys = { "<space>m" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			max_join_length = 1200,
		},
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"vue",
			"html",
		},
	},
	{ "whatyouhide/vim-textobj-xmlattr", dependencies = { "kana/vim-textobj-user" } },

	-- autocomplete and snippets
	{
		"dcampos/nvim-snippy",
		config = function()
			vim.g.vsnip_snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h") .. "/snippets"
		end,
	},

	-- lsp
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"tsserver",
				"html",
				"eslint",
				"gopls",
				"volar",
				"lua_ls",
			},
		},
	},

	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>" },
		},
		config = true,
	},

	{
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
	},
	-- not sure if I should keep
	{
		"mg979/vim-visual-multi",
		keys = {
			"<C-n>",
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			search = {
				mode = function(str)
					return "\\<" .. str
				end,
			},
			label = {
				-- allow uppercase labels
				uppercase = false,
				style = "overlay",
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"stevearc/qf_helper.nvim",
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			vim.keymap.set("n", "<leader>o", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
			vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file, { desc = "Add file to harpoon list" })
			for pos = 0, 9 do
				vim.keymap.set("n", "<leader>" .. pos, function()
					require("harpoon.ui").nav_file(pos)
				end, { desc = "Move to harpoon mark #" .. pos })
			end
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				vue = { "eslint_d" },
				css = { "stylelint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "eslint_d" },
					typescript = { "eslint_d" },
					vue = { "eslint_d" },
					css = { "stylelint" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
}
