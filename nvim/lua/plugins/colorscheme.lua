-- return {
--   "GertjanReynaert/cobalt2-vim-theme",
--   priority = 999,
--   config = function()
--     vim.cmd([[colorscheme cobalt2]])
--   end,
}

return {
  "lalitmee/cobalt2.nvim",
  priority = 999,
  -- event = { "ColorSchemePre" }, -- if you want to lazy load
  dependencies = { "tjdevries/colorbuddy.nvim" },
  init = function()
    require("colorbuddy").colorscheme("cobalt2")
  end,
}
