if vim.g.colors_name == 'cobalt2' then
  vim.cmd[[
    hi Comment cterm=italic guifg=#0088ff
    hi SignColumn guibg=#193549
    hi CursorLine term=underline ctermbg=234 guibg=#1F4662
    hi User1 guifg=#ffffff guibg=#1F4662
  ]]
end

-- Pretty Statusline
vim.cmd [[
set laststatus=2
set statusline=
set statusline+=%1*\ %{StatuslineMode()}                  " Mode
set statusline+=%1*\ %<%F\                                " File+path
set statusline+=%1*\ %=\%y\                               " FileType
set statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''}      " Encoding
set statusline+=%1*\ %{(&bomb?\",BOM\":\"\")}\            " Encoding2
set statusline+=%1*\%{&ff}\                               " FileFormat(dos/unix..)
set statusline+=%1*\ LN:%l/%L\                            " LineNumber
set statusline+=%1*\ Col:%03c\                            " ColNumber

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
]]

