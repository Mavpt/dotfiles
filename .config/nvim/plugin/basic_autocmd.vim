" Vertically center when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWrite * %s/\s\+$//e

" Disable autocommenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" VimWiki
augroup VimWikiEntries
        autocmd BufWritePre *.wiki call AddDate()
        autocmd BufWritePost *.wiki VimwikiAll2HTML
        autocmd ExitPre *.wiki VimwikiAll2HTML
augroup END
