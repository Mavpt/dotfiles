setlocal spell spelllang=en_us,pt_pt
source ~/.config/nvim/autocorrect.vim

" Insert Date on File Save
function AddDate()
        exe "normal m9"
        exe "normal G"
        %g/\n%% The last edit
        exe "normal dGo"
        exe "normal d0"
        put = '%% The last edit'
        put = '<center>Last changed on ' .strftime('%c') .'</center>'
        exe "normal `9"
endfunction
