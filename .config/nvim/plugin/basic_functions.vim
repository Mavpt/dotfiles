" Insert Date on File Save
function AddDate()
        exe 'normal G'
        %g/%% The last edit
        exe 'normal dGG'
        put = '%% The last edit'
        put = '<center>Last changed on ' .strftime('%c') .'</center>'
endfunction
