local fn = vim.fn
local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
  end
end

local function packer_start()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- plugins
  use 'wbthomason/packer.nvim'
  use 'fatih/vim-go'
  -- lsp
  use 'neovim/nvim-lspconfig'
  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-emoji'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
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
  use 'voldikss/vim-floaterm'
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
  use 'nvim-treesitter/playground'
  -- others
  use {'iamcco/markdown-preview.nvim', run = "cd app && yarn install"}
  use 'mbbill/undotree'
  use 'preservim/nerdcommenter'
  use 'godlygeek/tabular'
  use 'mattn/emmet-vim'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  -- colorschemes
  use 'ayu-theme/ayu-vim'
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
end

local function plugin_configs()
  require'telescope'.setup{
    defaults = {
      prompt_prefix = '🍛 '
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  }
  require'telescope'.load_extension('fzf')

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

end

packer_verify()
packer_start()
plugin_configs()


