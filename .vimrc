" FruitieX' .vimrc v0.3

execute pathogen#infect()

""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""

"colorscheme desert "awesome color scheme
set t_Co=256
colorscheme jellybeans

" flag problematic whitespace
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

" Prettier line wrap
"set nowrap
set showbreak=↪

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

" Avoid :w, :q, :x
map <C-s> :w<Enter>
map <C-q> :q<Enter>
map <C-x> :x<Enter>

nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F2>

" allow moving around in insert mode
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" vim hard mode :-)
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map <PageUp> <Nop>
map <PageDown> <Nop>

let mapleader=","
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <silent> <Leader><Leader>h :call MoveToPrevTab()<Enter>
nmap <silent> <Leader><Leader>l :call MoveToNextTab()<Enter>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

nnoremap gr :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<CR>
nnoremap gR :execute "vimgrep / " . expand("<cword>") . " /gj **" <Bar> cw<CR>

nnoremap <silent> <Leader>n :cn<Enter>
nnoremap <silent> <Leader>N :cp<Enter>
nnoremap <silent> <Leader>c :cc<Enter>

nmap <silent> <Leader>t :NERDTree<Enter>

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

" Keep 500 lines of command line history
set history=500

" Write persistent undo files
set undofile
set undolevels=1000
set undoreload=1000

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
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,~/music*,*~,*.swp

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

" watch for changes to .vimrc and update if it's changed
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""

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
