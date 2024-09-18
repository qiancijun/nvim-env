-- lua/plugins/error-lens.lua

return {
  {
    'chikko80/error-lens.nvim',
    dependencies = { 'neovim/nvim-lspconfig' }, -- 确保 LSP 已配置
    config = function()
      require('error-lens').setup {
        -- 配置诊断显示的虚拟文本（显示在代码行上）
        virtual_text = {
          -- 是否启用虚拟文本显示
          enable = false,
          -- 虚拟文本的格式
          format = function(diagnostic)
            local message = diagnostic.message
            -- 如果消息长度超过一定值，则进行换行
            local max_width = 40
            if #message > max_width then
              message = message:sub(1, max_width)
                .. '\n'
                .. message:sub(max_width + 1)
            end
            return string.format('%s (%s)', message, diagnostic.source)
          end,
        },
        -- 配置行末符号
        signs = {
          -- 是否显示行末的符号
          enable = true,
          -- 符号的字符
          symbols = {
            error = '',
            warning = '',
            info = '',
            hint = '',
          },
        },
        -- 配置诊断信息的显示优先级
        severity_sort = true,
        -- 配置诊断信息的显示方式
        update_in_insert = true,
      }
    end,
  },
}
