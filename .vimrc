" FruitieX' .vimrc v0.3

""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
execute pathogen#infect()

" powerline config
set laststatus=2
set noshowmode

" ctrlp config
let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_lazy_update = 100

" NERDCommenter needs this
filetype plugin on
" get rid of extra junk
let g:NERDTreeMinimalUI=1

" easymotion config
let g:EasyMotion_leader_key = '<Leader>'

let g:easytags_on_cursorhold = 0
let g:easytags_auto_highlight = 0

let g:ackprg="/usr/bin/vendor_perl/ack -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""

"colorscheme desert "awesome color scheme
"set t_Co=16
set background=dark
colorscheme base16-default

"hi Comment ctermfg=12
"hi Constant ctermfg=15
"hi Identifier ctermfg=4
"hi Statement ctermfg=2
"hi PreProc ctermfg=6
"hi Type ctermfg=1
"hi Special ctermfg=3
"hi Underlined ctermfg=7
"hi Ignore ctermfg=9
"hi Error ctermfg=11
"hi Todo ctermfg=1
"hi Normal ctermfg=none ctermbg=none
"hi NonText ctermfg=0 ctermbg=none
"hi Directory        ctermfg=12
"
"hi VertSplit        ctermfg=black
"hi StatusLine        ctermfg=green
"hi StatusLineNC        ctermfg=0
"
"hi Folded ctermbg=0 ctermfg=8
"
"hi Pmenu ctermfg=10 ctermbg=0
"hi PmenuSel ctermfg=0 ctermbg=14
"hi LineNr ctermfg=0 ctermbg=none
"hi CursorLine ctermfg=none ctermbg=none cterm=none
"hi CursorLineNr ctermfg=none ctermbg=0
"hi CursorColumn ctermfg=none ctermbg=0

" flag problematic whitespace
"match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace term=standout ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
"au InsertLeave * match ExtraWhitespace /\s\+$/

"use :set list! to toggle visible whitespace on/off
"set listchars=tab:>-,trail:.,extends:>

" Show line numbers
set number
" Enable syntax highlighting
syntax enable

"set colorcolumn=80 " show column at 80
highlight ColorColumn ctermbg=233 " in a subtle color pls

" Show matching braces
set showmatch

" >= 7 lines under cursor visible
set so=7

" Always show current pos
set ruler

" Prettier line wrap
set nowrap
set showbreak=↪

" Show tabs
set lcs=tab:│\ 
set list
highlight SpecialKey ctermfg=238

" Disable backup
set nobackup
set nowb
set noswapfile

" Make cursor more visible
"set cursorline
"set cursorcolumn

""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""

" Avoid escape key
imap jj <Esc>

" Bind ; to <C-]> (jump to definition), it's faster and C-] doesn't work oven PuTTY
"map ; <C-]>

" Avoid :w, :q
map <C-s> :w<Enter>
map <C-q> :q<Enter>

" function keys
set pastetoggle=<F2>
"nmap <silent> <F5> :checktime<Enter>
" buffers
map <silent><F5> :bprev<CR>
map <silent><F6> :bnext<CR>
" reindent entire file
map <F7> mzgg=G`z<CR>
" toggle tagbar
nmap <silent><F8> :TagbarToggle<CR>

" allow moving around in insert mode TODO: this does not work
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

noremap <C-e> <C-d>

" half page up/down with <C-j>, <C-k>
"noremap <C-j> <C-d>
"noremap <C-k> <C-u>

" free these
"noremap <C-d> <Nop>
"noremap <C-u> <Nop>

" vim hard mode :-)
" ok fine but DON'T USE THESE!
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>
"map <PageUp> <Nop>
"map <PageDown> <Nop>

" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk
" TODO: this breaks vimpager :(

"C-\ - Open function defintion in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"A-] - Open function defintion in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" leader keys
let mapleader=","

" split related binds
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <C-w><C-j> 5<C-w>+
nmap <C-w><C-k> 5<C-w>-
nmap <C-w><C-l> 5<C-w>>
nmap <C-w><C-h> 5<C-w><

" move tab left/right
nmap <silent> <Leader>H :call MoveToPrevTab()<Enter>
nmap <silent> <Leader>L :call MoveToNextTab()<Enter>

"nmap <silent> <Leader><Leader>t :tabnew<Enter>
map <leader><leader>tn :tabnew<cr>
map <leader><leader>to :tabonly<cr>
map <leader><leader>tc :tabclose<cr>
map <leader><leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader><leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" disable current search highlight
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" diff
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" open NERDTree
nmap <silent> <Leader><Leader>T :NERDTree<Enter>

" make
map <leader>m :make<CR>

" quick grepping
nnoremap gr :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<CR>
nnoremap gR :execute "vimgrep / " . expand("<cword>") . " /gj **" <Bar> cw<CR>

function! GREP( arg )
	execute "vimgrep /" . expand( a:arg ) . "/gj **"
	cwindow
endfunction

command! -nargs=* GREP call GREP( '<args>' )

" line complete
inoremap <C-l> <C-x><C-l>

" increment/decrement
"nnoremap <C-i> <C-a>
"nnoremap <C-d> <C-x>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" omni complete for html tags
inoremap <C-_> </<C-x><C-o>
map <C-_> a<C-_><ESC>

" move in quickfix window
nnoremap <silent> <Leader><Leader>n :cn<Enter>
nnoremap <silent> <Leader><Leader>N :cp<Enter>
nnoremap <silent> <Leader><Leader>c :cc<Enter>

" move lines up/down
nmap <leader><C-j> mz:m+<cr>`z
nmap <leader><C-k> mz:m-2<cr>`z
vmap <leader><C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <leader><C-k> :m'<-2<cr>`>my`<mzgv`yo`z

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

""""""""""""""""""""""""""""""""
" Behaviour
""""""""""""""""""""""""""""""""

" Don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

" Use utf8
set encoding=utf8

" Reload a file if it changes
set autoread
autocmd BufEnter * silent! checktime

" Keep 500 lines of command line history
set history=500

" Write persistent undo files
set undofile
set undolevels=1000
set undoreload=1000

" Allow switching buffers without writing to disk
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Smart case-sensitive search
set ignorecase
set smartcase

" Highlight search strings
set hlsearch
" Search as you type
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Disable visual bell (removes delay also)
set visualbell t_vb=

set switchbuf=split

" Better tab completion
set wildmode=longest,list,full
set wildmenu
" Ignore these files when completing names and in Explorer
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,~/music*,*~,*.swp

" Indentation
set noexpandtab
set shiftwidth=4
set tabstop=4
"set smarttab
filetype plugin indent on

" Default to autoindenting of C like languages
set autoindent
set smartindent

" syntastic stuff
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_c_checkers=['gcc']

" Show relative numbers in command mode, absolute in insert mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Restore cursor position
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
" Remember info about open buffers on close
set viminfo^=%

" more tabs
set tabpagemax=15

" show typed commands in lower right corner
set showcmd

function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
	return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
	close!
	if l:tab_nr == tabpagenr('$')
	  tabprev
	endif
	sp
  else
	close!
	exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
	return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
	close!
	if l:tab_nr == tabpagenr('$')
	  tabnext
	endif
	sp
  else
	close!
	tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! DiffToggle()
	if &diff
		diffoff
	else
		diffthis
	endif
:endfunction

" fix my broken themes
" matched parens fix
hi MatchParen cterm=bold ctermbg=8 ctermfg=15
" darker comments, they look nice and get ouf ot the way
hi Comment ctermfg=8
" don't have ridiculous colors on the menus
hi Pmenu ctermbg=18 ctermfg=2
" transparent background always
hi Normal ctermbg=none
" prettify searches
hi Search ctermfg=1 ctermbg=19
hi IncSearch ctermbg=9 ctermfg=18
" highlight cursor line number
hi CursorLineNr ctermbg=none ctermfg=7
" darken other line numbers
hi LineNr ctermbg=none ctermfg=8
" TODOs with red
hi Todo ctermbg=9
" wtf were they thinking
hi Visual ctermbg=0 term=none cterm=none
hi CursorLine ctermbg=0
" fix ugly splits
hi VertSplit ctermbg=none ctermfg=8
" i like yellow color on types more
hi Type ctermfg=3

" why does gitgutter have a green background by default
hi GitGutterAdd ctermbg=none
hi GitGutterChange ctermbg=none
hi GitGutterDelete ctermbg=none
hi GitGutterChangeDelete ctermbg=none
hi GitGutterAddLine ctermbg=none
hi GitGutterChangeLine ctermbg=none
hi GitGutterChangeDeleteLine ctermbg=none
hi GitGutterChangeLine ctermbg=none
hi SignColumn ctermbg=none

let g:airline_theme="fruit"
let g:airline_left_sep=""
let g:airline_right_sep=""

" MiniBufExplorer theme
hi MBEChanged ctermfg=9
hi MBEVisibleNormal ctermfg=20
hi MBEVisibleActiveNormal ctermfg=15
hi MBEVisibleActiveChanged ctermfg=11
hi MBEVisibleChanged ctermfg=9

" No extra space in numbers column
set numberwidth=1

