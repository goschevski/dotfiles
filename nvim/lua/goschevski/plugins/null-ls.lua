return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function ()
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.diagnostics.eslint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == 'null-ls'
                end,
                bufnr = bufnr
              })
            end,
          })
        end
      end,
    })
  end
}


