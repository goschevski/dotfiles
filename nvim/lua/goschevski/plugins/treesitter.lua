local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    'json',
    'javascript',
    'typescript',
    'tsx',
    'yaml',
    'html',
    'css',
    'markdown',
    'bash',
    'lua',
    'vim',
    'dockerfile',
    'gitignore',
    'diff',
    'go',
    'php',
    'regex',
    'vue'
  },
  auto_install = true
})
