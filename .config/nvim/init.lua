vim.cmd 'colo nord'

-- commands
vim.cmd([[
  augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  augroup END
]])

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

-- compilar cpp
vim.cmd [[ autocmd filetype cpp nnoremap <leader>cpp :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').''<CR> ]]

local g = vim.g
local o = vim.o

g.mapleader = ' '

local options = {
  completeopt = "menuone,noselect,noinsert",
  backup = false,
  errorbells = false,
  hidden = true,

  -- search
  hlsearch = false,
  incsearch = true,
  smartcase = true,
  ignorecase = true,

  scrolloff = 5,
  sidescrolloff = 5,

  guicursor = '',
  cursorline = true,
  nu = true,
  relativenumber = true,
  termguicolors = true,
  cursorcolumn = true,
  cc = '80',
  signcolumn = 'yes',
  wrap = false,

  autoindent = true,
  smartindent = true,

  -- tabs
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  splitright = true,
  splitbelow = true,
}

for k, v in pairs(options) do
  o[k] = v
end

vim.o.shortmess = vim.o.shortmess .. 'c'

require'bruno'
