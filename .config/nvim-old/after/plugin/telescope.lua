local actions = require('telescope.actions')
require'telescope'.setup{
  defaults = {
    prompt_prefix = '🍛 ',
    file_ignore_patterns = { "node%_modules/.*" },
    mappings = {
      i = {
        ['C-q'] = actions.send_to_qflist
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}

require'telescope'.load_extension('fzf')

local opt = { noremap = true, silent = true }
-- telescope
vim.keymap.set('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opt)
vim.keymap.set('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opt)
vim.keymap.set('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opt)
vim.keymap.set('n', '<C-p>', '<CMD>Telescope git_files<CR>', opt)
vim.keymap.set('n', '<leader>fs', '<CMD>Telescope git_status<CR>', opt)
vim.keymap.set('n', '<leader>gc', '<CMD>Telescope git_commits<CR>', opt)
vim.keymap.set('n', '<leader>gb', '<CMD>Telescope git_branches<CR>', opt)
vim.keymap.set('n', '<leader>com', '<CMD>Telescope commands<CR>', opt)
vim.keymap.set('n', '<leader>fi', '<CMD>Telescope current_buffer_fuzzy_find<CR>', opt)
vim.keymap.set('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opt)
vim.keymap.set('n', '<leader>fc', '<CMD>Telescope lsp_code_actions<CR>', opt)
vim.keymap.set('n', '<C-\\>', "<CMD>lua require'bruno.telescope'.find_dotfiles()<CR>", opt)
vim.keymap.set('n', '<leader>em', '<CMD>Telescope symbols<CR>', opt)
vim.keymap.set('i', '<C-\\>', '<CMD>Telescope symbols<CR>', opt)
vim.keymap.set(
  'n',
  '<leader>gs',
  "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
  opt
)

return M
