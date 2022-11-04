local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, 'telescope_actions')
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ['C-k'] = actions.move_selection_previous,
        ['C-j'] = actions.move_selection_next,
        ['C-q'] = actions.send_selected_to_qflist + actions.open_qflist
      }
    }
  },

  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true,
      sorter = require'telescope.sorters'.get_substr_matcher()
    }
  }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
