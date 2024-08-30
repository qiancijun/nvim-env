-- lua/plugins/alternate-toggler.lua

return {
  {
    'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup {
        -- 配置默认替换对
        alternates = {
          ['==='] = '!==',
          ['=='] = '!=',
          ['true'] = 'false',
          ['yes'] = 'no',
          ['on'] = 'off',
          ['enabled'] = 'disabled',
        },
      }
      local keymap = vim.keymap

      keymap.set('n', '<leader>i', '<cmd>ToggleAlternate<cr>')
    end,
  },
}
