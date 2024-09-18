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

    -- ts
    -- lspconfig.tsserver.setup {}
    lspconfig.ts_ls.setup {}

    -- python
    lspconfig.pylsp.setup {}

    -- tailwind
    lspconfig.tailwindcss.setup {
      filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
    }

    -- eslint
    lspconfig.eslint.setup {}

    -- rust
    lspconfig.rust_analyzer.setup {}

    -- markdown
    lspconfig.marksman.setup {}

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
