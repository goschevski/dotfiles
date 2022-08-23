require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'css', 'go', 'html', 'javascript', 'json', 'typescript', 'tsx', 'vue', 'lua', 'vim' },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
