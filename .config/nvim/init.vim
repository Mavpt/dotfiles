" -----Plugins-----
source ~/.config/nvim/vim-plug.vim
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
        "Plug 'vimwiki/vimwiki'
        "Plug 'ap/vim-css-color'
        Plug 'tpope/vim-fugitive'
        " Vim 0.5
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'hrsh7th/nvim-compe'
call plug#end()

" Map leader key
let mapleader=" "

" ------Plugin Settings------
"source ~/.config/nvim/plugconfig/vimwiki.vim
source ~/.config/nvim/plugconfig/vim-fugitive.vim
source ~/.config/nvim/plugconfig/lspconfig.vim
source ~/.config/nvim/plugconfig/nvim-treesitter.vim
source ~/.config/nvim/plugconfig/compe.vim
