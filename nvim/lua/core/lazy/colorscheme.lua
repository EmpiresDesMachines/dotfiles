return {
  "lalitmee/cobalt2.nvim",
  priority = 999,
  dependencies = { "tjdevries/colorbuddy.nvim" },
  config = function()
    require("colorbuddy").colorscheme("cobalt2")
    local colors = require("colorbuddy.color").colors
    local Group = require("colorbuddy.group").Group
    local styles = require("cobalt2.utils").styles

    -- Group.new("Comment", colors.dark_blue, nil, nil)
    Group.new("@number", colors.dark_pink, nil, nil)
    Group.new("@boolean", colors.dark_pink, nil, nil)
    Group.new("@method.call", colors.dark_orange, nil, nil)

    Group.new("@property", colors.light_blue, nil, nil)
    Group.new("@constant.builtin", colors.dark_pink, nil, nil)
    Group.new("@tag.attribute", colors.dark_pink, nil, nil)
    Group.new("@keyword", colors.light_pink, nil, styles.bold)
    Group.new("@keyword.function", colors.light_pink, nil, styles.bold)
    Group.new("@keyword.return", colors.dark_pink, nil, styles.bold)
    --
    -- Group.new("@include", colors.dark_pink, nil, nil)
    -- Group.new("@field", colors.light_blue, nil, nil)
    -- Group.new("Structure", colors.dark_blue, nil, nil)
    -- Group.new("Boolean", colors.dark_pink, nil, styles.none)
    -- Group.new("Function", colors.light_pink, nil, styles.none)
    -- Group.new("Keyword", colors.light_blue, nil, nil)
    -- Group.new("Ignore", colors.dark_grey, nil, nil)
    -- Group.new("Error", colors.red:light(), nil, nil)
    -- Group.new("Todo", colors.dark_orange, nil, nil)
    -- Group.new("SpecialComment", colors.light_green, nil, nil)
    -- Group.new("Include", colors.dark_pink, nil, nil)
    -- Group.new("Define", colors.dark_orange, nil, nil)
    -- Group.new("Exception", colors.light_pink, nil, nil)
    vim.cmd([[
      hi Comment cterm=italic guifg=#0088ff
      hi SignColumn guibg=#193549
      hi CursorLine term=underline ctermbg=234 guibg=#1F4662
      hi User1 guifg=#ffffff guibg=#1F4662
    ]])
  end
}

-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   priority = 999,
--   config = function()
--     vim.cmd("colorscheme oxocarbon")
--     -- transparent background
--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   end
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 999,
--   config = function()
--     vim.cmd("colorscheme kanagawa")
--   end
-- }

-- return {
--   "sainnhe/gruvbox-material",
--   priority = 999,
--   config = function()
--     vim.cmd([[
--       " Palette values: 'material'(default), 'mix', 'original'
--       g:gruvbox_material_foreground = material
--       " Set contrast: 'hard', 'medium'(default), 'soft'
--       let g:gruvbox_material_background = 'hard'
--
--       colorscheme gruvbox-material
--     ]])
--   end
-- }
--
