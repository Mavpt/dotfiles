setlocal spell spelllang=en_us,pt_pt
source ~/.config/nvim/autocorrect.vim

" Insert Date on File Save
function AddDate()
        let position = getpos(".")
        normal! G2o
        %g/\n<!--- The last edit -->/
        normal! dGo
        normal! cc<!--- The last edit -->
        put = '<center>Last changed on ' .strftime('%c') .'</center>'
        call setpos('.', position)
endfunction
