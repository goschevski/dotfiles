local cmp = require'cmp'

local kinds = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "ﰕ",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "廓",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local snippy = require('snippy')
cmp.setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(_, vim_item)
      vim_item.menu = vim_item.kind
      vim_item.kind = kinds[vim_item.kind]

      return vim_item
    end
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-t>'] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' },
    { name = 'path' },
  })
})
