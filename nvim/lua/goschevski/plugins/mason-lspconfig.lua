return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"astro-ls",
			"tsserver",
			"html",
			"eslint",
			"gopls",
			"volar",
			"lua_ls",
		},
	},
}
