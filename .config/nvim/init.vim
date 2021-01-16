" -----Plugins-----
source ~/.config/nvim/vim-plug.vim
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
        Plug 'vimwiki/vimwiki'
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

" ------VimWiki------
let g:vimwiki_autowriteall = 1
let g:vimwiki_auto_header = 1

let wiki = {}
let wiki.path = '$HOME/Documents/VimWiki'
let wiki.path_html = '$HOME/Documents/VimWiki/HTML'
let wiki.template_path = '$HOME/Templates/VimWiki'
let wiki.template_default = 'VimWiki'
let wiki.template_ext = '.html'
"let wiki.syntax = 'markdown'
let g:vimwiki_list = [wiki]
