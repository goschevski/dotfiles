return {
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
}
