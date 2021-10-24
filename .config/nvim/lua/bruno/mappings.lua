local map = vim.api.nvim_set_keymap

local function set_keymaps()

  local opt = { noremap = true, silent = true }

  map('i', '<C-c>', '<esc>', opt)

  map('t', '<esc>', '<c-\\><c-n>', opt)

  -- copy paste
  map('x', '<leader>p', '"_dP', opt)

  -- netrw
  map('n', '<leader>nn', '<CMD>Explore<CR>', opt)

  -- vim surround
  -- muda ' para "
  map("n", "<leader>\"\"", "f'cs'\"", {noremap = false, silent = true, expr = false})
  -- muda " para '
  map("n", "<leader>\''", "f\"cs\"'", {noremap = false, silent = true, expr = false})

  -- refactoring
  map("v", "<leader>re", [[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
  map("v", "<leader>rf", [[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
  map("v", "<leader>rt", [[ <Cmd>lua M.refactors()<CR>]], {noremap = true, silent = true, expr = false})

  -- emmet
  map("i", "<C-y>,", "<Cmd>:EmmetExpandAbbr<CR>", opt)

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

set_keymaps()
