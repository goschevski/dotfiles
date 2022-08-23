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
      sort_lastused = true
    }
  }
}
require('telescope').load_extension('fzf')
