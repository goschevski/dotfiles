return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"dcampos/cmp-snippy",
		"onsails/lspkind.nvim",
	},
	config = function()
		vim.opt.completeopt = { "menu", "menuone", "noselect" }
		local cmp = require("cmp")
		local snippy = require("snippy")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body)
				end,
			},
			formatting = {
				format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
			},
			experimental = {
				ghost_text = true,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-t>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if snippy.can_expand_or_advance() then
						snippy.expand_or_advance()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if snippy.can_jump(-1) then
						snippy.previous()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "snippy" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
