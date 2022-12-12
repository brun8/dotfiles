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

  -- packer
  use 'wbthomason/packer.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  --cache
  use 'lewis6991/impatient.nvim'

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'ThePrimeagen/git-worktree.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- harpoon
  use 'ThePrimeagen/harpoon'

  -- treesitter
  --use 'fatih/vim-go'
  use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
  use 'nvim-treesitter/playground'

  -- others
  use {'iamcco/markdown-preview.nvim', run = "cd app && yarn install"}
  use 'preservim/nerdcommenter'
  use 'mattn/emmet-vim'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'junegunn/goyo.vim'

  -- colorschemes
  use 'rebelot/kanagawa.nvim'
  use {
    'mcchrish/zenbones.nvim',
    requires = "rktjmp/lush.nvim"
}

end

local function plugin_configs()
  local lsp_installer = require'nvim-lsp-installer'

  -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
  -- or if the server is already installed).
  lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)

  require("nvim-autopairs").setup {}

  require'harpoon'.setup {
    global_settings = {
      enter_on_sendcmd = true,
    }
  }

end

packer_verify()
packer_start()
plugin_configs()

