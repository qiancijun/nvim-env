-- lua/plugins/vim-bookmarks.lua

return {
  {
    'MattesGroeger/vim-bookmarks',
    dependencies = {
      'tom-anders/telescope-vim-bookmarks.nvim',
    },
    config = function()
      -- 自定义配置选项
      vim.g.bookmark_sign = '⚑' -- 书签符号
      vim.g.bookmark_annotation_sign = '☰' -- 注释书签符号
      vim.g.bookmark_no_default_key_mappings = 1 -- 不使用默认快捷键
      vim.g.bookmark_auto_save = 1 -- 自动保存书签
      vim.g.bookmark_manage_per_buffer = 1 -- 每个缓冲区单独管理书签

      require('telescope').load_extension 'vim_bookmarks'

      -- 自定义快捷键
      vim.api.nvim_set_keymap(
        'n',
        'mm',
        ':BookmarkToggle<CR>',
        { noremap = true, silent = true }
      ) -- 切换书签
      vim.api.nvim_set_keymap(
        'n',
        'mi',
        ':BookmarkAnnotate<CR>',
        { noremap = true, silent = true }
      ) -- 添加注释书签
      vim.api.nvim_set_keymap(
        'n',
        'mn',
        ':BookmarkNext<CR>',
        { noremap = true, silent = true }
      ) -- 跳转到下一个书签
      vim.api.nvim_set_keymap(
        'n',
        'mp',
        ':BookmarkPrev<CR>',
        { noremap = true, silent = true }
      ) -- 跳转到上一个书签
      local keymap = vim.keymap
      keymap.set(
        'n',
        'ma',
        '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>'
      )

      vim.api.nvim_set_keymap(
        'n',
        'mc',
        ':BookmarkClear<CR>',
        { noremap = true, silent = true }
      ) -- 清除当前文件所有书签
    end,
  },
}
