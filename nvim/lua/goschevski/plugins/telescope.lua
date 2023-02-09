local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, 'telescope_actions')
if not actions_setup then
  return
end

local lga_actions = require("telescope-live-grep-args.actions")

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
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
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
telescope.load_extension('textcase')
telescope.load_extension("live_grep_args")

