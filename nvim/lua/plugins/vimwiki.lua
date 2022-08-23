vim.g.vimwiki_list = {{
  path = '~/My Drive/Notes/',
  syntax = 'markdown',
  ext = '.md'
}}
vim.g.vimwiki_map_prefix = '<Leader>n'
vim.g.vimwiki_key_mappings = { links = 0 }
vim.keymap.set('n', '<Leader><CR>', '<Plug>VimwikiToggleListItem')
