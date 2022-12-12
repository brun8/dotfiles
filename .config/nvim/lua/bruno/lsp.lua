local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function setup_sumneko()
  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

local function setup_lsp()
  local nvim_lsp = require'lspconfig'

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.name == "gopls" then
        vim.api.nvim_create_autocmd('BufWritePre', {
          callback = function()
            vim.lsp.buf.format()
          end,
          pattern = "*.go"
        })
      end

      vim.keymap.set('n', '<leader>ren', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
      vim.keymap.set('n', '<leader>de', '<Cmd>lua vim.diagnostic.open_float()<CR>', opt)
      vim.keymap.set('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
      vim.keymap.set('n', '<leader>fm', '<Cmd>lua vim.lsp.buf.format()<CR>', opt)
      vim.keymap.set('n', '<leader>dc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
      vim.keymap.set('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
      vim.keymap.set('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
      vim.keymap.set('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
    end,
  })


  local default_config = {
    on_attach = default_on_attach
  }

  local servers = require'bruno.servers'
  for _, server in ipairs(servers) do
    nvim_lsp[server].setup {}
  end

  -- setup_sumneko()
end

setup_lsp()
