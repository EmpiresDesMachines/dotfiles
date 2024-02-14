return {
	"mihaifm/bufstop",
	config = function()
		vim.cmd([[
      let g:BufstopAutoSpeedToggle = 1
      let g:BufstopSorting = 'none'
      map <leader>b :BufstopPreview<CR>
    ]])
	end,
}
