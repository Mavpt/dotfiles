" -----Basic Settings-----
" Backups and such
set backup
set backupdir=~/.cache/vim/
set swapfile
set dir=~/.cache/vim

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
set splitbelow
set splitright

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
