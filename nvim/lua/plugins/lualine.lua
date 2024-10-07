return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = "|", right = "|" },
        section_separators = { left = '', right = ''},
        ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 3,
            shorting_target = 40,
          }
        },
        lualine_y = {},
        lualine_z = { "%aLn:%l/%L Col:%03c" }, -- 
      }
    }
  end
}
