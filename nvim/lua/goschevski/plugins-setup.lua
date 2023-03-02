local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- bunch of plugins need this
  'nvim-lua/plenary.nvim',

  -- color scheme
  { 'catppuccin/nvim', name = 'catppuccin' },

  -- vim -> tmux integration
  'christoomey/vim-tmux-navigator',

  -- sidebar tree
  'nvim-tree/nvim-tree.lua',

  -- icons
  'kyazdani42/nvim-web-devicons',

  -- status line
  'feline-nvim/feline.nvim',

  -- telescope 
  { 'nvim-telescope/telescope.nvim', tag = '0.1.0' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-live-grep-args.nvim',

  -- ui improvements
  'lukas-reineke/indent-blankline.nvim',
  'lewis6991/gitsigns.nvim',

  -- tasks
  'CrispyDrone/vim-tasks',

  -- markdown
  'dhruvasagar/vim-table-mode',

  -- git
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',

  -- essentials
  'numToStr/Comment.nvim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'mattn/emmet-vim',
  'gpanders/editorconfig.nvim',
  'AndrewRadev/splitjoin.vim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'mileszs/ack.vim',
  'embear/vim-foldsearch',
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = { 'kana/vim-textobj-user' }},
  'johmsalas/text-case.nvim',

  -- autocomplete and snippets
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',
  'gaelph/logsitter.nvim',

  -- jumping (easymotion)
  { 'phaazon/hop.nvim', branch = 'v2' },

  -- smooth scroll
  'karb94/neoscroll.nvim',

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  },

  -- lsp
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  { 'glepnir/lspsaga.nvim', branch = 'main' },
  'jose-elias-alvarez/typescript.nvim',
  'onsails/lspkind.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'jayp0521/mason-null-ls.nvim',
  'mg979/vim-visual-multi',
  'abecodes/tabout.nvim'
})
