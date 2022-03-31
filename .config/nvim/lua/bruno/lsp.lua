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

  local function default_on_attach(client)
    --print('Attaching to ' .. client.name)

    --map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>de', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opt)
    --map('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>dc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    --map('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    --map('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
    --map('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
    --map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
    --map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
  end

  local default_config = {
    on_attach = default_on_attach
  }

  local servers = require'bruno.servers'
  for _, server in ipairs(servers) do
    nvim_lsp[server].setup {
      on_attach = function ()
      end
    }
  end

  -- setup_sumneko()
end

setup_lsp()
