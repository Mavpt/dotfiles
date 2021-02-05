setlocal spell spelllang=en_us,pt_pt
source ~/.config/nvim/autocorrect.vim

" Insert Date on File Save
function AddDate()
        exe 'normal Go'
        %g/\n%% The last edit
        exe 'normal dGGo'
        exe 'normal d0'
        put = '%% The last edit'
        put = '<center>Last changed on ' .strftime('%c') .'</center>'
endfunction
