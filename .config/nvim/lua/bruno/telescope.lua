local M = {}

M.find_dotfiles = function()
  require("telescope.builtin").find_files({
      prompt_title = " nvim ",
      cwd = "~/.config/nvim",
      hidden = true,
  })
end

return M
