return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"astro",
			"tsserver",
			"html",
			"eslint",
			"gopls",
			"volar",
			"lua_ls",
		},
	},
}
