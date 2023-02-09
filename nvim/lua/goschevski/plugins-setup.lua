local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- bunch of plugins need this
  use('nvim-lua/plenary.nvim')

  -- color scheme
  use({ 'catppuccin/nvim', as = 'catppuccin' })

  -- vim -> tmux integration
  use('christoomey/vim-tmux-navigator')

  -- sidebar tree
  use('nvim-tree/nvim-tree.lua')

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- status line
  use('feline-nvim/feline.nvim')

  -- telescope 
  use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0' })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use('nvim-telescope/telescope-file-browser.nvim')
  use('nvim-telescope/telescope-live-grep-args.nvim')

  -- ui improvements
  use('lukas-reineke/indent-blankline.nvim')
  use('lewis6991/gitsigns.nvim')

  -- tasks
  use('CrispyDrone/vim-tasks')

  -- markdown
  use('dhruvasagar/vim-table-mode')

  -- git
  use('tpope/vim-fugitive')
  use('sindrets/diffview.nvim')

  -- essentials
  use('numToStr/Comment.nvim')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('mattn/emmet-vim')
  use("gpanders/editorconfig.nvim")
  use('AndrewRadev/splitjoin.vim')
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')
  use('mileszs/ack.vim')
  use('embear/vim-foldsearch')
  use('kana/vim-textobj-user')
  use('whatyouhide/vim-textobj-xmlattr')
  use("johmsalas/text-case.nvim")

  -- autocomplete and snippets
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('dcampos/nvim-snippy')
  use('dcampos/cmp-snippy')
  use('gaelph/logsitter.nvim')

  -- jumping (easymotion)
  use({ 'phaazon/hop.nvim', branch = 'v2' })

  -- smooth scroll
  use('karb94/neoscroll.nvim')

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  })

  -- lsp
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use({ 'glepnir/lspsaga.nvim', branch = 'main' })
  use('jose-elias-alvarez/typescript.nvim')
  use('onsails/lspkind.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('jayp0521/mason-null-ls.nvim')
  use('stevearc/aerial.nvim')

  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- optional configuration
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
