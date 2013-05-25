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
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*.pyc

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

" Avoid :w, :q, :x
map <C-s> :w<Enter>
map <C-q> :q<Enter>
map <C-x> :x<Enter>

nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F2>

set tabpagemax=15

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
"set mouse=a "enable all mouse modes

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

" NERDCommenter needs this
filetype plugin on

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

let mapleader=","
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <Leader><Leader>h :call MoveToPrevTab()<Enter>
nmap <Leader><Leader>l :call MoveToNextTab()<Enter>
" watch for changes to .vimrc and update if it's changed
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
