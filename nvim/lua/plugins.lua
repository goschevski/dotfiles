vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }
  use { 'RRethy/nvim-base16' }
  use { 'neovim/nvim-lspconfig' }
  use { 'mattn/emmet-vim' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'tpope/vim-fugitive' }
  use { 'cohama/lexima.vim' }
  use { 'deathlyfrantic/lexima-template-rules' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'numToStr/Comment.nvim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'mileszs/ack.vim' }
  use { 'embear/vim-foldsearch' }
  use { 'johmsalas/text-case.nvim' }
  use { 'aserowy/tmux.nvim' }
  use { 'vimwiki/vimwiki' }
  use { 'voldikss/vim-floaterm' }
  use {
    'whatyouhide/vim-textobj-xmlattr',
    requires = {
      'kana/vim-textobj-user'
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    }
  }
  use {
    'CrispyDrone/vim-tasks'
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = "make"
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy'
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    after = 'nvim-web-devicons',
    config = function ()
      require('nvim-tree').setup()
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
end)

require('Comment').setup()
require('gitsigns').setup()
-- require('nvim-tree').setup()
require('hop').setup()
require('textcase').setup()
