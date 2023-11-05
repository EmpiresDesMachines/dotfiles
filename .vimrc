set fileformat=unix
set nocompatible
set encoding=utf-8
set belloff=all
set cursorline
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set mouse=a
set noshowmode
set scrolloff=8
set timeoutlen=1000 ttimeoutlen=10
set splitright
set t_RV=

set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile

set smartindent
set number relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden

set termguicolors
set background=dark
syntax enable

" Wrap settings
set nowrap
au BufRead,BufNewFile *.md,*.txt setlocal wrap linebreak nolist

" Set the leader key
let mapleader = ' '

" Map escape
imap jj <Esc>

" hlsearch Clear
nmap <leader>n :noh<CR>

" Buffer shortcuts
nmap <leader>w :w!<CR>
nmap <leader>qq :bd<CR>
nmap <leader>qa :bufdo bd<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Immediately add a closing quotes or braces in insert mode
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Close Tab
map <leader>tc :q<CR>

" Moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Cut/Copy/Paste using the 'standard' hotkeys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Use the system clipboard for copy and paste
" If this option doesn't work for you then install vim-gtk or vim-gtk3
set clipboard^=unnamed,unnamedplus

" Restore the last cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Automatically delete all trailing whitespace on save
au BufWritePre * %s/\s\+$//e

" Change the cursor between normal and insert modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Settings for hidden chars
set nolist
set lcs=tab:\|\ ,space:·,precedes:«,extends:»

" Install vim-plug if it's not already installed (Unix-only)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-dirvish' " Path navigator [1]
Plug 'mihaifm/bufstop'      " Buffers navigation [2]
Plug 'jpalardy/vim-slime'   " Emacs Slime [3]
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'     " Fuzzy Finder [4]
Plug 'easymotion/vim-easymotion' " Easy Motions [5]
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' } " [6] Coc
Plug 'AndrewRadev/tagalong.vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim' " [10] Emmet

Plug 'GertjanReynaert/cobalt2-vim-theme' " [7] Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

" [8] Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'tpope/vim-commentary' " [9] Comment stuff out

"Plug 'Yggdroot/indentLine'
"Plug 'tribela/vim-transparent'

call plug#end()

" Path navigator [1]
" Default key bind: -

" Buffers navigation [2]
let g:BufstopAutoSpeedToggle = 1
let g:BufstopSorting = 'none'
map <leader>b :Bufstop<CR>
" Native use (without a plugin)
" map <leader>b :ls<CR>:b

" Emacs Sline [3]
" Default key bind: C-c-c
let g:slime_target = 'vimterminal'
let g:slime_vimterminal_cmd = 'node'
let g:slime_vimterminal_config = {
  \'vertical': 1,
  \ 'term_cols': &columns * 1/3,}

" Fuzzy Finder [4]
let g:fzf_layout = {'down': '100%'}
map <leader>ff :Files<CR>
map <leader>fb :BLines<CR>
map <leader>fl :Lines<CR>
map <leader>fg :GFiles?<CR>

" Easy Motions [5]
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case-insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to line
nmap <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" Jump to anywhere you want
"One character: `<leader>s{char}{label}`
nmap <leader>s <Plug>(easymotion-overwin-f)
"Two characters: `<leader><leader>s{char}{char}{label}`
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

" [6] COC
let g:coc_global_extensions=['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-css', 'coc-json']
nmap <leader><leader>p :CocCommand prettier.forceFormatDocument<CR>
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" [7] Colorschemes
colorscheme cobalt2 " cobalt2 gruvbox ayu
if g:colors_name == 'cobalt2'
  hi Comment cterm=italic
  hi SignColumn guibg=#193549
  hi CursorLine term=underline ctermbg=234 guibg=#1F4662
  hi User1 guifg=#ffffff guibg=#1F4662
endif

" [8] Markdown Preview
nmap <leader><leader>m :MarkdownPreviewToggle<CR>

" [9] Comment stuff out
" Default key bind: gcc

" [10] Emmet
let g:user_emmet_leader_key=','



if has_key(plugs, 'vim-transparent')
  set nocursorline
endif

" Pretty Statusline [?]
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


