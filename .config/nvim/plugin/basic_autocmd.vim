" Vertically center when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWrite * %s/\s\+$//e

" Disable autocommenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shell
augroup Shell
        autocmd BufNewFile *.sh put!='#!/bin/sh'
augroup END

" VimWiki
augroup VimWiki
        autocmd BufWritePre *.wiki call AddDate()
        autocmd BufWritePost *.wiki VimwikiAll2HTML
        autocmd ExitPre *.wiki VimwikiAll2HTML
augroup END

" LaTeX
augroup LaTeX
        autocmd BufWritePost *.tex execute "!pdflatex % && rm *.log *.aux"
augroup END

" Markdown
augroup VimWiki
        autocmd BufWritePre *.md call AddDate()
        autocmd BufWritePost *.md !pandoc % -o %:r.html
augroup END


