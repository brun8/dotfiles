require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
  'javascript',
  'json',
  'tsx',
  'typescript',
  'lua',
  'python',
  'go',
  'ruby',
  'cpp'
},
  highlight = { enable = true }
}
