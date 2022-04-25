require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
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
}
