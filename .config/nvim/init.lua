--local colorscheme_cmd = 'colo kanagawa'
--local success, err = pcall(vim.cmd, colorscheme_cmd)
--if not success then
  --vim.api.nvim_err_writeln(err)
--end
vim.api.nvim_command('colo kanagawa')

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.astro',
  callback = function()
    vim.api.nvim_command('set filetype=astro')
  end
})

-- seta o compilador g++ pra arquivos c++
-- :make compila o arquivo e gera o excecutavel com o mesmo nome
vim.api.nvim_create_autocmd({'BufEnter'}, {
  pattern = "*.cpp",
  callback = function ()
    vim.api.nvim_command("set makeprg=g++\\ %\\ -o\\ %<")
  end
})

--commands
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
--vim.cmd [[ autocmd filetype cpp nnoremap <leader>cpp :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').''<CR> ]]


local g = vim.g
local o = vim.o

g.mapleader = ' '

local options = {

  filetype = true,
  backup = false,
  errorbells = false,
  hidden = false,

  -- search
  hlsearch = false,
  incsearch = true,
  smartcase = true,
  ignorecase = true,

  scrolloff = 5,
  sidescrolloff = 5,

  --guicursor = '',
  cursorline = true,
  nu = true,
  relativenumber = true,
  termguicolors = true,
  --cursorcolumn = true,
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

--vim.cmd [[set bg=light]]

vim.o.shortmess = vim.o.shortmess .. 'c'

require'bruno'
