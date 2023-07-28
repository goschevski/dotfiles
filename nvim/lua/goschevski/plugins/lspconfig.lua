return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
	},
	config = function()
		local typescript = require("typescript")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prevCR>", opts)
			vim.keymap.set("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
			vim.keymap.set("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opts)
			vim.keymap.set("n", "<Leader>gs", vim.lsp.buf.signature_help, opts)

			if client.name == "tsserver" then
				vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
			end
		end

		local servers = { "tsserver", "html", "eslint", "gopls", "volar" }
		local capabilities = cmp_nvim_lsp.default_capabilities()

		for _, lsp in pairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				init_options = {
					preferences = { disableSuggestions = true },
				},
			})
		end

		typescript.setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
				init_options = {
					preferences = { disableSuggestions = true },
				},
			},
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
