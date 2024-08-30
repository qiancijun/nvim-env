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

    -- -- go
    -- lspconfig.gopls.setup {}
    -- -- python
    -- lspconfig.pyright.setup {}
    -- -- tailwindcss
    lspconfig.tailwindcss.setup {}

    lspconfig.rust.setup {}

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
