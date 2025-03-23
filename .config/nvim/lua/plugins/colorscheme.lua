-- return {
--   "GertjanReynaert/cobalt2-vim-theme",
--   priority = 999,
--   config = function()
--     vim.cmd([[
--       colorscheme cobalt2
--       hi Comment cterm=italic
--       hi SignColumn guibg=#1932549
--       hi CursorLine term=underline ctermbg=234 guibg=#1F4662
--       hi User1 guifg=#ffffff guibg=#1F4662
--     ]])
--   end,
-- }
-- return {
--   "GlennLeo/cobalt2",
--   priority = 999,
--   config = function()
--     vim.cmd("colorscheme cobalt2")
--   end,
-- }
-- return {
--   "lalitmee/cobalt2.nvim",
--   event = { "ColorSchemePre" }, -- if you want to lazy load
--   dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
--   init = function()
--     require("colorbuddy").colorscheme("cobalt2")
--   end,
-- }
return {
  "lalitmee/cobalt2.nvim",
  priority = 999,
  dependencies = { "tjdevries/colorbuddy.nvim" },
  config = function()
    require("colorbuddy")
    require("cobalt2")
    local colors = require("colorbuddy.color").colors
    local Group = require("colorbuddy.group").Group
    local styles = require("cobalt2.utils").styles

    Group.new("@number", colors.dark_pink, nil, nil)
    Group.new("@boolean", colors.dark_pink, nil, nil)
    Group.new("@method.call", colors.dark_orange, nil, nil)

    Group.new("@property", colors.light_blue, nil, nil)
    Group.new("@constant.builtin", colors.dark_pink, nil, nil)
    Group.new("@tag.attribute", colors.dark_pink, nil, nil)
    Group.new("@keyword", colors.light_pink, nil, styles.bold)
    Group.new("@keyword.function", colors.light_pink, nil, styles.bold)
    Group.new("@keyword.return", colors.dark_pink, nil, styles.bold)
    vim.cmd([[
      hi Comment cterm=italic guifg=#0088ff
      hi SignColumn guibg=#193549
      hi CursorLine term=underline ctermbg=234 guibg=#1F4662
      hi User1 guifg=#ffffff guibg=#1F4662
    ]])
  end,
}

-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   priority = 999,
--   config = function()
--     vim.cmd("colorscheme oxocarbon")
--     -- transparent background
--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   end,
-- }

-- return {
--   "navarasu/onedark.nvim",
--   lazy = false,
--   priority = 9999,
--   opts = {},
--   config = function()
--     require("onedark").setup({
--       style = "deep",
--       transparent = true,
--       term_colors = false,
--       ending_tildes = false,
--       cmp_itemkind_reverse = false,
--
--       toggle_style_key = "<leader>ct",
--       toggle_style_list = { "dark", "darker", "cool", "warm", "warmer", "deep", "light" },
--
--       -- Options are italic, bold, underline, none and combos 'italic,bold'
--       code_style = {
--         comments = "italic",
--         keywords = "none",
--         functions = "none",
--         strings = "none",
--         variables = "none",
--       },
--
--       lualine = { transparent = true },
--       diagnostics = { darker = true, undercurl = true, background = false },
--     })
--     require("onedark").load()
--
--     -- transparent background
--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 999,
--   config = function()
--     vim.cmd("colorscheme kanagawa")
--   end,
-- }

-- return {
--   "uloco/bluloco.nvim",
--   lazy = false,
--   priority = 1000,
--   dependencies = { "rktjmp/lush.nvim" },
--   config = function()
--     vim.cmd([[
--       colorscheme bluloco-dark
--     ]])
--   end,
-- }
--
-- return {
--   "sainnhe/gruvbox-material",
--   priority = 999,
--   config = function()
--     vim.cmd([[
--       " Palette values: 'material'(default), 'mix', 'original'
--       "g:gruvbox_material_foreground = material
--       " Set contrast: 'hard', 'medium'(default), 'soft'
--       let g:gruvbox_material_background = 'hard'
--
--       colorscheme gruvbox-material
--     ]])
--   end,
-- }
--
