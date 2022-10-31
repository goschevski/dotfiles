vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', focusable = false })
local opts = { noremap = true, silent = true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>gp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<Leader>gn', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<Leader>gs', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
end

local servers = { 'tsserver', 'html', 'eslint', 'grammarly' }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      preferences = { disableSuggestions = true }
    }
  }
end
