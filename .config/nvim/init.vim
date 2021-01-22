" -----Plugins-----
source ~/.config/nvim/vim-plug.vim
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
        Plug 'vimwiki/vimwiki'
        Plug 'ap/vim-css-color'
call plug#end()

" ------Plugin Settings------
source ~/.config/nvim/plugconfig/vimwiki.vim
