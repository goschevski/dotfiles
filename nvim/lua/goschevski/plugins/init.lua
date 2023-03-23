return {
  -- bunch of plugins need this
  'nvim-lua/plenary.nvim',

  -- vim -> tmux integration
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      '<C-h>',
      '<C-j>',
      '<C-k>',
      '<C-l>'
    }
  },

  -- ui
  {
    'karb94/neoscroll.nvim',
    keys = {
      '<C-d>',
      '<C-u>'
    },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- git
  {
    'tpope/vim-fugitive',
    keys = {
     { "<leader>gst", "<cmd>Git<cr>" },
     { "<leader>gb", "<cmd>Git blame<cr>" },
     { "<leader>gco", "<cmd>Gread<cr>:w<CR>" }
    }
  },
  {
    'sindrets/diffview.nvim',
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>" }
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    keys = {
      { '<Leader>gso', '<cmd>Gitsigns preview_hunk<CR>' },
      { ']c', '<cmd>Gitsigns next_hunk<CR>' },
      { '[c', '<cmd>Gitsigns prev_hunk<CR>' }
    },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- essentials
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'mattn/emmet-vim',
    ft = {
      'vue',
      'html'
    }
  },
  {
    -- remove when update neovim to 0.9 because it supports editoconfig by default
    'gpanders/editorconfig.nvim',
     event = { "BufReadPost", "BufNewFile" }
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        max_join_length = 1200,
      })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'vue',
      'html'
    }
  },
  {
    'embear/vim-foldsearch',
    config = function()
      vim.g.foldsearch_disable_mappings = 1
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    keys = {
      { 's', "<cmd>HopWord<CR>" }
    },
    config = function()
      require('hop').setup({})
    end,
  },
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = { 'kana/vim-textobj-user' }},

  -- autocomplete and snippets
  {
    'dcampos/nvim-snippy',
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ':p:h') .. '/snippets'
    end
  },

  -- lsp
  {
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup({})
    end
  },
  {
   'glepnir/lspsaga.nvim',
    branch = 'main',
    config = {
      move_in_saga = { prev = '<C-k>', next = '<C-j>' },
      finder_action_keys = {
        open = '<CR>',
      },
      definition_action_keys = {
        edit = '<CR>'
      }
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = {
      ensure_installed = {
        "tsserver",
        "html",
        "eslint",
        "gopls",
        "volar",
        "lua_ls"
      }
    }
  },
  {
    'jayp0521/mason-null-ls.nvim',
    config = {
      ensure_installed = {
        "eslint_d"
      }
    }
  },

  -- not sure if I should keep
  {
    'mg979/vim-visual-multi',
    keys = {
      '<C-n>'
    }
  }
}
