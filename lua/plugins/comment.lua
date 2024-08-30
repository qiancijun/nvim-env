return {
  {
    'numToStr/Comment.nvim',
    opts = {
      padding = true,
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable_autocmd = false,
    },
    config = function()
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == 'commentstring'
            and require('ts_context_commentstring.internal').calculate_commentstring()
          or get_option(filetype, option)
      end
      require('Comment').setup {
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      }
    end,
  },
}
