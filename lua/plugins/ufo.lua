-- Ensure you have the necessary dependencies and LSP configured
-- This example assumes you have set up an LSP server for your language

return {
  -- nvim-ufo setup
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      -- Use LSP as the fold provider
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          -- Use LSP for folding if available
          return { 'lsp', 'indent' }
        end,
        -- 配置折叠文本的显示方式
        fold_virt_text_handler = function(
          virtText,
          lnum,
          endLnum,
          width,
          truncate
        )
          local newVirtText = {}
          local suffix = ('  %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              table.insert(newVirtText, { chunkText, chunk[2] })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- 不能再插入更多内容
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix
                  .. string.rep(' ', targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, 'MoreMsg' })
          return newVirtText
        end,
      }
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      -- 在 Lua 配置文件中设置 nvim-ufo 的快捷键

      -- 展开所有折叠
      vim.api.nvim_set_keymap(
        'n',
        'zR',
        [[<Cmd>lua require('ufo').openAllFolds()<CR>]],
        { noremap = true, silent = true }
      )

      -- 折叠所有代码
      vim.api.nvim_set_keymap(
        'n',
        'zM',
        [[<Cmd>lua require('ufo').closeAllFolds()<CR>]],
        { noremap = true, silent = true }
      )

      -- 展开当前光标下的折叠
      vim.api.nvim_set_keymap(
        'n',
        'zr',
        [[<Cmd>lua require('ufo').openFoldsExceptKinds()<CR>]],
        { noremap = true, silent = true }
      )

      -- 折叠当前光标下的折叠
      vim.api.nvim_set_keymap(
        'n',
        'zm',
        [[<Cmd>lua require('ufo').closeFoldsWith()<CR>]],
        { noremap = true, silent = true }
      )

      -- 根据 LSP 获取折叠范围
      vim.api.nvim_set_keymap(
        'n',
        'zv',
        [[<Cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>]],
        { noremap = true, silent = true }
      )
    end,
  },
}
