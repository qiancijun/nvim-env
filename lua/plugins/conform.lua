return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gopls' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- 当 LSP 不支持格式化操作时，使用 conform.nvim
      },
    }
  end,
}

