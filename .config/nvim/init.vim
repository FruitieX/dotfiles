" FruitieX' .vimrc v0.3

""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'mbbill/undotree'
Plug 'FruitieX/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
call plug#end()

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" incsearch fuzzy
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" neocomplete
let g:neocomplete#enable_at_startup = 1

" powerline config
set laststatus=2
set noshowmode

" ctrlp config
let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
"let g:ctrlp_lazy_update = 100

" NERDCommenter needs this
filetype plugin on
" get rid of extra junk
let g:NERDTreeMinimalUI=1

" easymotion config
let g:EasyMotion_leader_key = '<Leader>'

let g:ackprg="/usr/bin/vendor_perl/ack -H --nocolor --nogroup --column"
let g:ackhighlight=1

""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""
set background=dark
colorscheme base16-default

" flag problematic whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace term=standout ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

set colorcolumn=100 " show column at 80
highlight ColorColumn ctermbg=233 " in a subtle color pls

" Show line number
set number

" Show matching braces
set showmatch

" >= 7 lines under cursor visible
set so=7

" Always show current pos
set ruler

" Disable line wraps
set nowrap

" Show tabs
set lcs=tab:│\ 
set list
highlight SpecialKey ctermfg=238

" Disable backup
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""

" Avoid escape key
imap jj <Esc>

map <C-p> :CtrlPMixed<cr>

" Faster than :w, :q
map <C-s> :w<Enter>
map <C-q> :q<Enter>

" terminals suck
if has('nvim')
    nmap <silent><bs> :<c-u>TmuxNavigateLeft<CR>
endif

" function keys
set pastetoggle=<F2>
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F4> :UndotreeToggle<cr>
nnoremap <silent> <F5> :checktime<CR>

" buffers
map <silent><F6> :bprev<CR>
map <silent><F7> :bnext<CR>
" reindent entire file
map <F8> mzgg=G`z<CR>

noremap <C-e> <C-d>

" leader keys
let mapleader=","

" split related binds
nmap <C-w><C-j> 5<C-w>+
nmap <C-w><C-k> 5<C-w>-
nmap <C-w><C-l> 5<C-w>>
nmap <C-w><C-h> 5<C-w><

" move tab left/right
nmap <silent> <Leader>H :call MoveToPrevTab()<Enter>
nmap <silent> <Leader>L :call MoveToNextTab()<Enter>

" tabs
map <leader><leader>tn :tabnew<cr>
map <leader><leader>to :tabonly<cr>
map <leader><leader>tc :tabclose<cr>
map <leader><leader>tm :tabmove

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" disable current search highlight
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" diff
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" make
map <leader>m :make<CR>

" quick grepping
nnoremap <silent>gr :Ack<CR>

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

""""""""""""""""""""""""""""""""
" Behaviour
""""""""""""""""""""""""""""""""

" Don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

" Keep 500 lines of command line history
set history=500

" Write persistent undo files
set undofile
set undodir=$HOME/.vim/undo
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
" Expand tabs to spaces
set expandtab
" indent with 4 spaces when tab key is hit
set softtabstop=4
" indent with 4 spaces when the indent commands are used
set shiftwidth=4
" tab character is represented by 4 spaces
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
hi Search ctermfg=9 ctermbg=25
hi IncSearch ctermbg=9 ctermfg=18
" highlight cursor line number
hi CursorLineNr ctermbg=none ctermfg=7
" darken other line numbers
hi LineNr ctermbg=none ctermfg=8
" TODOs with red
hi Todo ctermbg=9
" wtf were they thinking
hi Visual ctermbg=19 term=none cterm=none
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
let g:airline#extensions#tabline#enabled = 1

" No extra space in numbers column
set numberwidth=1

" Use unnamed clipboard by default
set clipboard=unnamed

" JSX extension not required for JSX files
let g:jsx_ext_required = 0
