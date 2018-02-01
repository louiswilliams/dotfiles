syntax on
colorscheme molokai

" Normal escape
imap jj <Esc>
" Escape and move right 1 character
imap jl <Esc>l

" Convert tabs to spaces and set tab spacing
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Allow backspace
set backspace=indent,eol,start

" Auto-indent
set ai

" Line numbers and ruler
set ruler
set nu

" Highlight search
set hlsearch
set incsearch
set ignorecase 
" Don't highlight after exiting search
noh

" Disable error bels
set noerrorbells

" Hide buffers 
set hidden

" Don't make swap files or keep backups
" set nobackup
" set nowb
set noswapfile

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
Plug 'https://github.com/oblitum/YouCompleteMe',
            \ {'do': 'python3 ./install.py --clang-completer --gocode-completer'}
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/szw/vim-tags.git'
call plug#end()

" command FixIt 'YcmCompleter FixIt'
" set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1

let g:go_fmt_command = "goimports"

let g:CommandTAcceptSelectionCommand='edit'
let g:CommandTAcceptSelectionSplitCommand='sp'
let g:CommandTAcceptSelectionVSplitCommand='vs'

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

let g:vim_tags_ignore_files = ['.gitignore']

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" Lint and clangformat commands
" command EsLint execute "!eslint % --fix"

" Helpers for buffer cycling
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>

" Insert matching parens and braces
inoremap {<CR> {<CR>}<Esc>O
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i

vmap . I//<Esc>

" Use space character as leader
let mapleader = " "
let g:mapleader = " "

" New buffer
" nmap <leader>t :enew<CR>
" Next buffer
nmap <leader>l :bn<CR>
" Previous buffer
nmap <leader>h :bp<CR>
" Close buffer and go to previous
nmap <leader>bq :bp <BAR> :bd #<CR>
" Close buffer 
nmap <leader>bd :bd<CR>
" List buffers
nmap <leader>bl :ls<CR>
" Horizontal split window
nmap <leader>n <C-W>n
" New horizontal split window
nmap <leader>s <C-W>s
" Close current window
nmap <leader>c <C-W>c
" Vertical split
nmap <leader>v <C-W>v
" Next window
nmap <leader>[ <C-W>w
" Prev window
nmap <leader>] <C-W>p
nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q!<CR>

" Tab cycles windows
map <Tab> <C-W>w

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = ":t"  
