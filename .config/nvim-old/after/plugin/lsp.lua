require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "gopls", "rust_analyzer" }
})

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  --["rust_analyzer"] = function ()
    --require("rust-tools").setup {}
  --end
}

local function setup_lsp()
  local aucmd = vim.api.nvim_create_autocmd
  local map = vim.keymap.set

  aucmd('LspAttach', {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      --if client.name == "gopls" then
        --vim.api.nvim_create_autocmd('BufWritePre', {
          --callback = function()
            --vim.lsp.buf.format()
          --end,
          --pattern = "*.go"
        --})
      --end

      local opt = { silent = true, noremap = true }

      map('n', '<leader>de', '<Cmd>lua vim.diagnostic.open_float()<CR>', opt)
      map('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
      map('n', '<leader>rf', '<Cmd>lua vim.lsp.buf.references()<CR>', opt)
      map('n', '<leader>fm', '<Cmd>lua vim.lsp.buf.format()<CR>', opt)
      map('n', '<leader>dc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
      map('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
      map('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
      map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
      map('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opt)
      map('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
    end,
  })
end

setup_lsp()
