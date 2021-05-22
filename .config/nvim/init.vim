" -----Plugins-----
source ~/.config/nvim/vim-plug.vim
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
        Plug 'vimwiki/vimwiki'
        Plug 'ap/vim-css-color'
        Plug 'tpope/vim-fugitive'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"
syntax enable
filetype plugin indent on

" ------Plugin Settings------
source ~/.config/nvim/plugconfig/vimwiki.vim
source ~/.config/nvim/plugconfig/coc.vim
