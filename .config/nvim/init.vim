let mapleader=" "
" -----Plugins-----
call plug#begin('~/local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
call plug#end()

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

" -----Basic AutoCmd-----
" Vertically center when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWrite * %sl/\s\+$//e

" Disable autocommenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" -----Keybindings------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
