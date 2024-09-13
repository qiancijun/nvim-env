-- lua/plugins/lualine.lua

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'ayu_light',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            'filename',
            {
              function()
                local conda_env = os.getenv 'CONDA_DEFAULT_ENV'
                if conda_env then
                  return 'Conda: ' .. conda_env
                else
                  return ''
                end
              end,
              icon = '', -- 你可以根据需求选择不同的图标
            },
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' ',
              },
            },
            'encoding',
            'fileformat',
            'filetype',
            {
              function()
                local msg = 'No Active LSP'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = ' LSP:',
              color = { fg = '#ddd', gui = 'bold' },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
