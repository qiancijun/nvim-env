-- lua/plugins/transparent.lua

return {
  {
    'xiyaowong/transparent.nvim',
    opts = {
      enable = true,
    },
    config = function()
      require('transparent').setup {
        extra_groups = {
          'NormalNC',
          'NvimTreeNormal',
          'NvimTreeEndOfBuffer',
          'NvimTreeStatusLine',
          'NvimTreeStatusLineNC',
          'StatusLine',
          'StatusLineNC',
          'SignColumn',
        },
        exclude_groups = {},
      }
    end,
  },
}
