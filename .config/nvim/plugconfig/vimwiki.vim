" ------Vimwiki------
" General settings
let g:vimwiki_autowriteall = 1
let g:vimwiki_auto_header = 1

" Wikis
let wiki = {}
let wiki.path = '$HOME/Documents/VimWiki'
let wiki.path_html = '$HOME/Documents/VimWiki/HTML'
let wiki.template_path = '$HOME/Templates/VimWiki'
let wiki.template_default = 'VimWiki'
let wiki.template_ext = '.html'
"let wiki.syntax = 'markdown'
let g:vimwiki_list = [wiki]

" Avoid taking control of .md files (https://vi.stackexchange.com/questions/16528/mardown-files-always-have-vimwiki-filetype-vimwiki-plugin)
let g:vimwiki_global_ext = 0
