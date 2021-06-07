local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")
end

-- gambiarra rsrs
local function clear_white_space()
  vim.cmd([[
    fun! TrimWhiteSpace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
    endfun
    augroup WhiteSpace
      autocmd!
      autocmd BufWritePre * :call TrimWhiteSpace()
    augroup END
  ]])
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    signcolumn = 'yes',
    hlsearch = false,
    incsearch = true,
    hidden = true,
    scrolloff = 5,
    softtabstop = 2,
    showmode = false,
    smartcase = true,
    ignorecase = true,
    termguicolors = true,
    guicursor = "",
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=2')
  vim.cmd('set updatetime=300')
  vim.cmd "syntax enable"
  vim.cmd "syntax on"
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_vim_config()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  clear_white_space()
end

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
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

  use {'neoclide/coc.nvim', branch = 'release'}
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'ThePrimeagen/git-worktree.nvim'}
  }
  -- harpoon
  use 'ThePrimeagen/harpoon'
  -- terminal
  use 'voldikss/vim-floaterm'
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
  use 'nvim-treesitter/playground'
  -- others
  -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  use {'iamcco/markdown-preview.nvim', run = "cd app && yarn install"}
  use 'tpope/vim-fugitive'
  use 'mbbill/undotree'
  use 'preservim/nerdtree'
  use 'preservim/nerdcommenter'
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'machakann/vim-sandwich'
  use 'junegunn/goyo.vim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'fatih/vim-go', run = 'GoUpdateBinaries'}
  -- colorschemes
  use 'gruvbox-community/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'ayu-theme/ayu-vim'
  use 'ghifarit53/tokyonight-vim'

  require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

  local lualine_opts = {
    options = {
      theme = 'ayu_mirage'
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'location'},
    }
  }
  require'lualine'.setup(lualine_opts)

  vim.g.go_fmt_autosave = 0
  vim.g.go_imports_autosave = 0

end

local function set_packer_config()
  packer_verify()
  packer_start()
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local opt = { noremap = true, silent = true }

  map('n', '<C-c>', '<esc>', opt)

  -- netrw
  map('n', '<leader>nn', '<CMD>Explore<CR>', opt)

  -- telescope
  map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opt)
  map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opt)
  map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opt)
  map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opt)
  map('n', '<C-p>', '<CMD>Telescope git_files<CR>', opt)

  -- worktree
  map('n', '<leader>wc', '<CMD>lua require("git-worktree").create_worktree(vim.fn.input("Worktree name > "), vim.fn.input("Worktree upstream > "))<CR>', opt)
  map('n', '<leader>ws', '<CMD>lua require("git-worktree").switch_worktree(vim.fn.input("Worktree name > "))<CR>', opt)
  map('n', '<leader>wd', '<CMD>lua require("git-worktree").delete_worktree(vim.fn.input("Worktree name > "))<CR>', opt)

  -- harpoon
  map('n', '<leader>m', ":lua require'harpoon.mark'.add_file()<CR>", opt)
  map('n', '<C-x>', ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", opt)
  map('n', '<C-h>', ":lua require'harpoon.ui'.nav_file(1)<CR>", opt)
  map('n', '<C-j>', ":lua require'harpoon.ui'.nav_file(2)<CR>", opt)
  map('n', '<C-k>', ":lua require'harpoon.ui'.nav_file(3)<CR>", opt)
  map('n', '<C-l>', ":lua require'harpoon.ui'.nav_file(4)<CR>", opt)
  map('n', '<leader>rr', ":lua require'harpoon.mark'.rm_file()<CR>", opt)
  map('n', '<leader><C-r>', ":lua require'harpoon.mark'.clear_all()<CR>", opt)

  --floaterm
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', opt)

  -- goyo
  map('n', '<leader>go', "<CMD>:Goyo<CR>", opt)

  -- markdown-previwer
  map('n', '<leader>md', "<CMD>:MarkdownPreviewToggle<CR>", opt)

  -- NERDTree
  map('n', '<C-n>', "<CMD>:NERDTreeToggle<CR>", opt)

  -- navigate completion menu
  map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
  map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

  -- coc
  local coc_opts = { silent=true, noremap=false }

  map('n', '<leader>gd', '<Plug>(coc-definition)', coc_opts)
  map('n', '<leader>dd', '<Plug>(coc-definition)', coc_opts)
  map('n', '<leader>gi', '<Plug>(coc-implementation)', coc_opts)
  map('n', '<leader>gr', '<Plug>(coc-references)', coc_opts)
  map('n', '<leader>rn', '<Plug>(coc-rename)', coc_opts)
  map('n', '<leader>fm', '<Plug>(coc-format-selected)', coc_opts)
  map('v', '<leader>fm', '<Plug>(coc-format-selected)', coc_opts)

  -- vim-go
  map('n', '<leader>gfmt', '<CMD>:GoFmt<CR>', opt)


end

local function set_colorscheme()
  vim.cmd "colo ayu"
end

set_vim_config()
set_packer_config()
set_keymaps()
set_colorscheme()

