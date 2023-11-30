return {
  'jpalardy/vim-slime',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.cmd[[
      " Emacs Sline
      " Default key bind: <C-c-c>
      let g:slime_target = 'tmux'
  ]]
  end
}
