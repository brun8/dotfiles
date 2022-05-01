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

local M = {}
M.find_dotfiles = function()
  require("telescope.builtin").find_files({
      prompt_title = " nvim ",
      cwd = "~/.config/nvim",
      hidden = true,
  })
end

return M

