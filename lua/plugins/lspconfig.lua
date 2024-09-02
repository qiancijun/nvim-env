return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    -- lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    -- python
    lspconfig.pyright.setup {}

    -- tailwind
    lspconfig.tailwindcss.setup {}

    -- gopls
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
    lspconfig.gopls.setup {
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unuseedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    }
  end,
}
