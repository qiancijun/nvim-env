return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('mason-lspconfig').setup {}
    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua-language-server',
        'stylua',
        'eslint_d',
        'prettierd',
        'rust-analyzer',
        'prisma-language-server',
        'gopls',
        'tailwindcss',
        'pylsp',
        'pyright',
      },
      require('lspconfig').pyright.setup {
        capabilities = capabilities,
      },
    }
  end,
}

