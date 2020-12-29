" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Sets
set ruler			" Show cursor position all the time
set number			" Show current line number
set relativenumber		" Show relative line numbers

set splitbelow			" Vertical split goes bellow current window
set splitright			" Side split goes to the right of the current window

set hlsearch			" Highlight search
set ic				" Case insensitve search

set backup			" Backup
set backupdir=~/.cache/vim//,.
" set undo 			" Undo
set undodir=~/.cache/vim//,.
set swapfile			" Swap
set dir=~/.cache/vim//,.

set wildmode=longest,list,full	" Autocomplete

" Autocommands
autocmd BufWritePre * %s/\s\+$//e " Remove all trailing whitespaces

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable autocommenting on newline


" Maps
" S = Replace All
nnoremap S :%s//g<Left><Left>

" Block arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

