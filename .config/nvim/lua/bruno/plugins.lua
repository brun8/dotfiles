local fn = vim.fn
local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
  end
end

local function packer_start()
  local packer = nil

  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- plugins
  use 'wbthomason/packer.nvim'
  -- lsp
  use 'neovim/nvim-lspconfig'
  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'ThePrimeagen/git-worktree.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "folke/todo-comments.nvim"
  -- harpoon
  use 'ThePrimeagen/harpoon'
  -- refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
  -- terminal
  --use 'voldikss/vim-floaterm'
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
  use 'nvim-treesitter/playground'
  -- others
  use {'iamcco/markdown-preview.nvim', run = "cd app && yarn install"}
  use 'mbbill/undotree'
  use 'preservim/nerdcommenter'
  use 'mattn/emmet-vim'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  -- colorschemes
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/everforest'
  use 'ayu-theme/ayu-vim'
  use 'cocopon/iceberg.vim'
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
end

local function plugin_configs()

  require("todo-comments").setup {}

  require("nvim-autopairs").setup {}

  require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = ".",
        scope_incremental = "s",
        node_decremental = ",",
      },
    },
  }

  require'harpoon'.setup {
    global_settings = {
      enter_on_sendcmd = true,
    }
  }

  --vim.g.user_emmet_leader_key = '<C-v>'

end

packer_verify()
packer_start()
plugin_configs()


