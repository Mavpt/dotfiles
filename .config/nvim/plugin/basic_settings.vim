" Backups and such
set backup
set backupdir=~/.cache/vim/backup
set swapfile
set dir=~/.cache/vim/swap
set undofile
set undodir=~/.cache/vim/undo
if !isdirectory($HOME."/.cache/vim/undo")
        call mkdir(HOME."/.cache/vim", "", 0700)
        call mkdir(HOME."/.cache/vim/backup", "", 0700)
        call mkdir(HOME."/.cache/vim/swap", "", 0700)
        call mkdir(HOME."/.cache/vim/undo", "", 0700)
endif

" Use mouse and system clipboard
set mouse=a			" Allow for use of mouse
set clipboard+=unnamedplus	" Use system clipboard

" Colorscheme
set termguicolors
colorscheme nord

" Encoding
set encoding=utf-8
set fileencodings=utf-8

" Splits
" set splitbelow
" set splitright

" Syntax highlighting
syntax on

" Cursor position
set ruler
set number relativenumber
set cursorline cursorcolumn

" Autocomplete
set wildmode=longest,list,full

" Searching
set hlsearch
set ignorecase

" Identation
set expandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8
