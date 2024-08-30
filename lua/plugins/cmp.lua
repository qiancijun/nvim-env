return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'petertriho/cmp-git',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    cmp.setup {
      completion = {
        completeopt = 'menu, menuone, preview, noselect',
        keyword_length = 1, -- 触发补全时用户需要输入的最小字符数
        completeitems = { 'buffer', 'snippet', 'lsp' }, -- 指定在补全菜单中显示哪些补全类型
        sort = true, -- 启用补全排序
      },
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping.select_next_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ['<S-Tab>'] = cmp.mapping.select_prev_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- 向上滚动文档
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- 向下滚动文档
        ['<C-Space>'] = cmp.mapping.complete(), -- 手动触发补全
        ['<C-e>'] = cmp.mapping.abort(), -- 取消补全
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- 确认补全项
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luansip' },
        { name = 'crates' },
      }, {
        { name = 'buffer' },
      }),
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- 针对 `/` 和 `?` 命令的搜索补全配置
    cmp.setup.cmdline({ '/', '?' }, {
      sources = {
        { name = 'buffer' },
      },
    })

    -- 针对 `:` 命令行模式的补全配置
    -- cmp.setup.cmdline(':', {
    --   sources = cmp.config.sources({
    --     { name = 'path' },
    --   }, {
    --     { name = 'cmdline' },
    --   }),
    -- })

    -- snippets
    require('luasnip.loaders.from_vscode').load {
      paths = { '~/.config/nvim/snippets' },
    }
  end,
}

