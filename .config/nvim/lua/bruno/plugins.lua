local M = {}

local function setup_comment()
  require("Comment").setup {
    -- LHS of operator-pending mapping in NORMAL + VISUAL mode
    opleader = {
      -- line-comment keymap
      line = "gc",
      -- block-comment keymap
      block = "gb",
    },

    -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    mappings = {

      -- operator-pending mapping
      -- Includes:
      --  `gcc`               -> line-comment  the current line
      --  `gcb`               -> block-comment the current line
      --  `gc[count]{motion}` -> line-comment  the region contained in {motion}
      --  `gb[count]{motion}` -> block-comment the region contained in {motion}
      basic = true,

      -- extra mapping
      -- Includes `gco`, `gcO`, `gcA`
      extra = true,
    },

    -- LHS of toggle mapping in NORMAL + VISUAL mode
    toggler = {
      -- line-comment keymap
      --  Makes sense to be related to your opleader.line
      line = "gcc",

      -- block-comment keymap
      --  Make sense to be related to your opleader.block
      block = "gbc",
    },

    -- Pre-hook, called before commenting the line
    --    Can be used to determine the commentstring value
    -- pre_hook = nil,

    -- Post-hook, called after commenting is done
    --    Can be used to alter any formatting / newlines / etc. after commenting
    -- post_hook = nil,

    -- Can be used to ignore certain lines when doing linewise motions.
    --    Can be string (lua regex)
    --    Or function (that returns lua regex)
    -- ignore = nil,
  }

  local comment_ft = require "Comment.ft"
  comment_ft.set("lua", { "--%s", "--[[%s]]" })
end

local function setup_treesitter()
  require 'nvim-treesitter.configs'.setup({
    ensure_installed = {
      'vimdoc',
      'python',
      'go',
      'rust',
      'lua',
      'typescript',
      'tsx',
      'javascript',
      'json',
    },
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = ".",
        scope_incremental = "grc",
        node_decremental = ",",
      },
    },
  })
end

local function plugin_configs()
  require("nvim-autopairs").setup {}
end

local function lazy_install()
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
end

local function lazy_start()
  require("lazy").setup({
    -- mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    --cache
    'lewis6991/impatient.nvim',

    -- cmp
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- telescope
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'ThePrimeagen/git-worktree.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- harpoon
    'ThePrimeagen/harpoon',

    -- treesitter
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = setup_treesitter
    },
    'nvim-treesitter/playground',

    -- others
    {
      'iamcco/markdown-preview.nvim',
      run = "cd app && yarn install"
    },
    {
      'numToStr/Comment.nvim',
      config = setup_comment
    },

    'mbbill/undotree',
    'mattn/emmet-vim',
    'windwp/nvim-autopairs',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'junegunn/goyo.vim',

    -- colorschemes
    'rebelot/kanagawa.nvim',
    {
      'mcchrish/zenbones.nvim',
      dependencies = "rktjmp/lush.nvim"
    },

  })
end

M.setup = function()
  lazy_install()
  lazy_start()
  plugin_configs()
end

return M

--lazy_install()
--lazy_start()
