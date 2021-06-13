----- Bootstrap packer.nvim -----
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        execute 'packadd packer.nvim'
end

----- Install Plugins -----
return require('packer').startup(function()
	-- Packer
        use 'wbthomason/packer.nvim'

	-- Theming
  	use 'arcticicestudio/nord-vim'

	-- Git
        use 'tpope/vim-fugitive'

	-- Code editting
        use 'neovim/nvim-lspconfig'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'hrsh7th/nvim-compe'
        use 'hrsh7th/vim-vsnip'
        --use 'ap/vim-css-color'

	-- Other
        use 'vimwiki/vimwiki'
	--use 'glepnir/dashboard-nvim'
	--use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }}
end)