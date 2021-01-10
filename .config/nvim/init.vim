" -----Plugins-----
source ~/.config/nvim/vim-plug.vim
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
call plug#end()

" -----Basic Settings-----
source ~/.config/nvim/basic_settings.vim

" -----Basic AutoCmd-----
" Vertically center when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWrite * %sl/\s\+$//e

" Disable autocommenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" -----Macros------
let mapleader=","

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <leader>- a------<Esc>

autocmd FileType sh map <leader>b i#!/bin/sh<CR><CR>
