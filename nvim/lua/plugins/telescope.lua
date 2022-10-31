require('telescope').setup {
  defaults = {
    prompt_prefix = "     ",
    selection_caret = "  ",
    entry_prefix = "  ",
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true,
      sorter = require'telescope.sorters'.get_substr_matcher()
    }
  }
}
require('telescope').load_extension('fzf')
