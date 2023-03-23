return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-live-grep-args.nvim'
  },
  config = function()
    local actions = require('telescope.actions')
    local lga_actions = require('telescope-live-grep-args.actions')

    require('telescope').setup({
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
              ["<C-l>"] = lga_actions.quote_prompt({ postfix = " -g !package-lock.json"}),
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

    require('telescope').load_extension('fzf')
    require('telescope').load_extension("live_grep_args")
  end
}
