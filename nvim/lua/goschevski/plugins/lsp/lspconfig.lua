local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  return
end

local typescript_status, typescript = pcall(require, 'typescript')
if not typescript_status then
  return
end

local keymap = vim.keymap


local on_attach = function (client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prevCR>', opts)
  keymap.set('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap.set('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  keymap.set('n', '<Leader>gs', vim.lsp.buf.signature_help, opts)
  keymap.set('n', '<Leader>o', '<cmd>LSoutlineToggle<CR>', opts)

  if client.name == 'tsserver' then
    keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')
  end
end

local servers = { "tsserver", "html", "eslint", "gopls", "volar" }
local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig.bashls.setup({})
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      preferences = { disableSuggestions = true }
    }
  })
end

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
    init_options = {
      preferences = { disableSuggestions = true }
    }
	},
})

lspconfig['sumneko_lua'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  }
})
