" Install vim-plug

" Expand the home directory to an absolute path.
let homeDir = expand('~')

" Find the desired VimPlug install location for different system configurations.
if(has('win32') || has('win64'))
    if has('nvim')
        let shareDir=homeDir.'\AppData\Local\nvim'
        let plugVim=shareDir.'\autoload\plug.vim'
    else
        let shareDir=homeDir.'\vimfiles'
        let plugVim=shareDir.'\autoload\plug.vim'
    endif
else
    if has('nvim')
        let shareDir=homeDir.'/.local/share/nvim/site'
        let plugVim=shareDir.'/autoload/plug.vim'
    else
        let shareDir=homeDir.'/.vim'
        let plugVim=shareDir.'/autoload/plug.vim'
    endif
endif

" Url of the VimPlug script.
let plugUri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(expand(plugVim)))
    if has('win32') || has('win64')
    	" Make sure the autoload directory has been created.
        exec '!md '.shareDir.'\autoload'
        
        " Download VimPlug using PowerSHell.
        exec '!powershell -command Invoke-WebRequest -Uri "'.plugUri.'" -OutFile '.plugVim.'"'
    else
        " Download VimPlug using curl.
        exec '!curl -fLo '.plugVim.' --create-dirs '.plugUri
    endif

	" Automatically run PlugInstall command.
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
