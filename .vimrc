" FruitieX' .vimrc v0.2

""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""

"colorscheme desert "awesome color scheme
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"colorscheme xoria256
colorscheme jellybeans
"colorscheme two2tango

" Powerline stuff
"set rtp+=~/src/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'
set laststatus=2
set noshowmode

" ctrlp stuff
let g:ctrlp_max_height = 30
set wildignore+=*.pyc

"if ! has('gui_running')
"    set ttimeoutlen=10
"    augroup FastEscape
"        autocmd!
"        au InsertEnter * set timeoutlen=0
"        au InsertLeave * set timeoutlen=1000
"    augroup END
"endif

" Who doesn't work on dark terminals?!?
"set background=dark

" Make the completion menus readable
"highlight Pmenu ctermfg=0 ctermbg=3
"highlight PmenuSel ctermfg=0 ctermbg=7

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

" Show line numbers
set number
" Enable syntax highlighting
syntax enable

set colorcolumn=80 " show column at 80
highlight ColorColumn ctermbg=234 " in a subtle color pls

" Show matching braces
set showmatch

" >= 7 lines under cursor visible
set so=7

" Always show current pos
set ruler

" Don't wrap lines, i hate that!
set nowrap

" Make cursor more visible
"set cursorline
"set cursorcolumn

""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""

" Avoid escape key
imap jj <Esc>

" Bind ; to <C-]> (jump to definition), it's faster and C-] doesn't work oven PuTTY
map ; <C-]>

map <F1> :buffer 1<CR>
map <F2> :buffer 2<CR>
map <F3> :buffer 3<CR>
map <F4> :buffer 4<CR>
map <F5> :buffer 5<CR>
map <F6> :buffer 6<CR>
map <F7> :buffer 7<CR>
map <F8> :buffer 8<CR>
map <F9> :buffer 9<CR>
map <F10> :buffer 10<CR>
map <F11> :buffer 11<CR>
map <F12> :buffers<CR>

set tabpagemax=15

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

" Keep 50 lines of command line history
set history=100

" Write persistent undo files
set undofile
set undolevels=500
set undoreload=500

" Allow switching buffers without writing to disk
set hidden

" Smart case-sensitive search
set ignorecase
set smartcase

" Highlight search strings
set hlsearch
" Search as you type
set incsearch

" Disable visual bell (removes delay also)
set visualbell t_vb=

" Better tab completion
set wildmode=longest,list,full
set wildmenu
" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Indentation
set noexpandtab
set shiftwidth=4
set tabstop=4
set smarttab

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Default to autoindenting of C like languages
set noautoindent smartindent

"C-\ - Open function defintion in a new tab
"A-] - Open function defintion in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set mouse=a "enable all mouse modes

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

au Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim

" Autocomplete with tab, only characters precede cursor
" function! Smart_TabComplete()
"	let line = getline('.')							" current line
" 
"	let substr = strpart(line, -1, col('.')+1)		" from the start of the current
"													" line to one character right
"													" of the cursor
"	let substr = matchstr(substr, "[^ \t]*$")		" word till cursor
"	if (strlen(substr)==0)							" nothing to match on empty string
"	  return "\<tab>"
"	endif
"	let has_period = match(substr, '\.') != -1		" position of period, if any
"	let has_slash = match(substr, '\/') != -1		" position of slash, if any
"	if (!has_period && !has_slash)
"	  return "\<C-X>\<C-P>"							" existing text matching
"	elseif ( has_slash )
"	  return "\<C-X>\<C-F>"							" file matching
"	else
"	  return "\<C-X>\<C-O>"							" plugin matching
"	endif
" endfunction
" 
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

execute pathogen#infect()
