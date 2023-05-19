return {
	-- bunch of plugins need this
	"nvim-lua/plenary.nvim",

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

	-- ui
	{
		"karb94/neoscroll.nvim",
		keys = {
			"<C-d>",
			"<C-u>",
		},
		config = function()
			require("neoscroll").setup()
		end,
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
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gdo", "<cmd>DiffviewOpen<cr>" },
			{ "<leader>gdc", "<cmd>DiffviewClose<cr>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufWrite" },
		keys = {
			{ "<Leader>gsh", "<cmd>Gitsigns preview_hunk<CR>" },
			{ "<Leader>grh", "<cmd>Gitsigns reset_hunk<CR>" },
			{ "]c", "<cmd>Gitsigns next_hunk<CR>" },
			{ "[c", "<cmd>Gitsigns prev_hunk<CR>" },
		},
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- essentials
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
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
		-- remove when update neovim to 0.9 because it supports editoconfig by default
		"gpanders/editorconfig.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"Wansmer/treesj",
		keys = { "<space>m" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				max_join_length = 1200,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"vue",
			"html",
		},
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		keys = {
			{ "s", "<cmd>HopWord<CR>" },
		},
		config = function()
			require("hop").setup({})
		end,
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
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = {
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			symbol_in_winbar = {
				enable = false,
			},
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = {
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
		"jayp0521/mason-null-ls.nvim",
		config = {
			automatic_installation = true,
			automatic_setup = true,
			ensure_installed = {
				"stylua",
				"eslint_d",
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
		config = function()
			require("trouble").setup({})
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
		"stevearc/qf_helper.nvim",
		config = function()
			require("qf_helper").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				-- function to run on opening the terminal
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				-- function to run on closing the terminal
				on_close = function(term)
					vim.cmd("startinsert!")
				end,
			})

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	"mbbill/undotree",
	{
		"folke/todo-comments.nvim",
		keys = {
			{ "<leader>xt", "<cmd>TodoTrouble<cr>" },
			{ "<leader>fx", "<cmd>TodoTelescope<cr>" },
		},
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
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
}
