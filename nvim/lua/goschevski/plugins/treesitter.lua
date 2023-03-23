return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
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
  end
}
