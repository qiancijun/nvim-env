-- lua/plugins/cursorline.lua

return {
  {
    'yamatsum/nvim-cursorline',
    config = function()
      require('nvim-cursorline').setup {
        cursorline = {
          enable = true, -- 启用光标行高亮
          timeout = 1000, -- 光标行高亮延迟时间（毫秒）
          number = false, -- 是否高亮行号
        },
        cursorword = {
          enable = true, -- 启用光标单词高亮
          min_length = 3, -- 只高亮长度不小于3的单词
          hl = { underline = true }, -- 自定义高亮样式为下划线
        },
      }
    end,
  },
}
