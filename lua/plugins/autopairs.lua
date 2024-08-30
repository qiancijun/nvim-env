-- lua/plugins/autopairs.lua
return {
  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require 'nvim-autopairs'

      npairs.setup {
        -- 配置自动插入配对字符的选项
        enable_check_bracket_line = true, -- 检查行是否需要自动插入配对字符
        enable_bracket_in_quote = true, -- 在引号内自动插入配对字符
        enable_abbr = true, -- 启用自动替换缩写
        disable_filetype = { 'TelescopePrompt' }, -- 禁用某些文件类型中的自动配对
        ignored_next_char = '[%w%.]', -- 忽略下一字符（正则表达式）
        enable_afterquote = true, -- 在引号后启用自动配对
      }

      -- 如果你使用了补全插件（如 nvim-cmp），确保集成
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
