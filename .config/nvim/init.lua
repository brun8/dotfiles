local cmd = vim.api.nvim_command
local fn = vim.fn local packer = nil
local o = vim.o
local map = vim.api.nvim_set_keymap

local function set_augroup()
  vim.cmd([[
    augroup WrapInMarkdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    augroup END
  ]])
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
    completeopt = "menuone,noselect,noinsert",
    backup = false,
    errorbells = false,
    hidden = true,

    hlsearch = false,
    incsearch = true,
    hidden = true,

    scrolloff = 5,
    sidescrolloff = 5,

    showmode = false,
    smartcase = true,
    ignorecase = true,
    termguicolors = true,
    guicursor = "",
    cursorline = true,
    signcolumn = 'yes',
    cc = '80',
    showmatch = true,

    splitright = true,
    splitbelow = true,

    joinspaces = false,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.opt[k] = v
  end

  -- Custom vim.o
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set updatetime=300')
  vim.cmd "syntax enable"
  vim.cmd "syntax on"

  local opt = vim.opt

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
  --lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
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
  use 'jiangmiao/auto-pairs'
  use 'godlygeek/tabular'
  use 'mattn/emmet-vim'
  use 'machakann/vim-sandwich'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- colorschemes
  use 'ayu-theme/ayu-vim'
  use 'navarasu/onedark.nvim'

  -- configs

  require'telescope'.setup{
    defaults = {
      prompt_prefix = '≈ '
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

  require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = ".",
        scope_incremental = "<leader>s",
        node_decremental = ",",
      },
    },
  }

  local lualine_opts = {
    options = {
      theme = 'ayu_dark'
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

  local opt = { noremap = true, silent = true }

  map('n', '<C-c>', '<esc>', opt)
  map('t', '<esc>', '<c-\\><c-n>', opt)

  -- copy paste
  map('x', '<leader>p', '"_dP', opt)

  -- netrw
  map('n', '<leader>nn', '<CMD>Explore<CR>', opt)

  -- refactoring
  map("v", "<Leader>re", [[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
  map("v", "<Leader>rf", [[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
  map("v", "<Leader>rt", [[ <Cmd>lua M.refactors()<CR>]], {noremap = true, silent = true, expr = false})


  -- tabular
  map('n', '<leader>tb', '<cmd>:Tab/=<cr>', opt)
  map('v', '<leader>tb', '<cmd>:Tab/=<cr>', opt)
  map('n', '<leader>tab', '<cmd>:Tab/|<cr>', opt)
  map('v', '<leader>tab', '<cmd>:Tab/|<cr>', opt)

  -- telescope
  map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opt)
  map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opt)
  map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opt)
  map('n', '<C-p>', '<CMD>Telescope git_files<CR>', opt)
  map('n', '<leader>gc', '<CMD>Telescope git_commits<CR>', opt)
  map('n', '<leader>gb', '<CMD>Telescope git_branches<CR>', opt)
  map('n', '<leader>com', '<CMD>Telescope commands<CR>', opt)
  map('n', '<leader>fi', '<CMD>Telescope current_buffer_fuzzy_find<CR>', opt)
  map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opt)
  map(
    'n',
    '<leader>gs',
    "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
    opt
  )
  map('n', '<leader>td', '<CMD>TodoTelescope<CR>', opt)

  -- worktree
  map('n', '<leader>wc', '<CMD>lua require("git-worktree").create_worktree(vim.fn.input("Worktree name > "), vim.fn.input("Worktree upstream > "))<CR>', opt)
  map('n', '<leader>ws', '<CMD>lua require("git-worktree").switch_worktree(vim.fn.input("Worktree name > "))<CR>', opt)
  map('n', '<leader>wd', '<CMD>lua require("git-worktree").delete_worktree(vim.fn.input("Worktree name > "))<CR>', opt)
  map('n', '<leader>wt', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', opt)

  -- harpoon
  map('n', '<leader>mm', "<cmd>lua require'harpoon.mark'.add_file()<cr>", opt)
  map('n', '<C-x>', ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", opt)
  map('n', '<C-h>', ":lua require'harpoon.ui'.nav_file(1)<CR>", opt)
  map('n', '<C-j>', ":lua require'harpoon.ui'.nav_file(2)<CR>", opt)
  map('n', '<C-k>', ":lua require'harpoon.ui'.nav_file(3)<CR>", opt)
  map('n', '<C-l>', ":lua require'harpoon.ui'.nav_file(4)<CR>", opt)
  map('n', '<leader>rr', ":lua require'harpoon.mark'.rm_file()<CR>", opt)
  map('n', '<leader><C-r>', ":lua require'harpoon.mark'.clear_all()<CR>", opt)

  --floaterm
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', opt)
  map('n', '<leader>gg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', opt)

  -- goyo
  map('n', '<leader>go', "<CMD>:Goyo<CR>", opt)

  -- markdown-previwer
  map('n', '<leader>md', "<CMD>:MarkdownPreviewToggle<CR>", opt)

  -- lsp
  map('n', '<leader>ee', '<cmd>:edit<cr>', opt)
  map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
  map('n', '<leader>de', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opt)
  map('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
  map('n', '<leader>dc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  map('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  map('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
  map('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
  map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
  map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
end

local function set_colorscheme()
  vim.g.onedark_style = 'darker'
  vim.cmd "colo ayu"
end

local function setup_compe()
  local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
    else
      return false
    end
  end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
  --_G.tab_complete = function()
    --if vim.fn.pumvisible() == 1 then
      --return t "<C-n>"
    --elseif vim.fn.call("vsnip#available", {1}) == 1 then
      --return t "<Plug>(vsnip-expand-or-jump)"
    --elseif check_back_space() then
      --return t "<Tab>"
    --else
      --return vim.fn['compe#complete']()
    --end
  --end
  --_G.s_tab_complete = function()
    --if vim.fn.pumvisible() == 1 then
      --return t "<C-p>"
    --elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
      --return t "<Plug>(vsnip-jump-prev)"
    --else
      ---- If <S-Tab> is not working in your terminal, change it to <C-h>
      --return t "<S-Tab>"
    --end
  --end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


  require 'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      path = true,
      buffer = true,
      -- calc = true,
      --vsnip = true,
      nvim_lsp = true,
      nvim_lua = true,
      spell = true,
      -- tags = true,
      -- snippets_nvim = true,
      -- treesitter = true,
    },
  }

end

local function setup_lsp()
  local nvim_lsp = require'lspconfig'

  local function default_on_attach(client)
    --print('Attaching to ' .. client.name)

    --map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    --map('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
    --map('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
  end

  local default_config = {
    on_attach = default_on_attach
  }

  local servers = { "gopls", "solargraph", "tsserver", "pyright" }
  for _, server in ipairs(servers) do
    nvim_lsp[server].setup {}
  end
end

set_vim_config()
set_packer_config()
set_colorscheme()
setup_lsp()
setup_compe()
set_keymaps()

